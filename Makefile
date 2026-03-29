CONFIG_DIR = config

SRCS = $(shell find $(CONFIG_DIR) -type f)

TARGET = ../zmk/app/build/zephyr/zmk.uf2
COMMON_BUILD_ARGS = -b seeeduino_xiao_ble -S studio-rpc-usb-uart -- -DSHIELD=kan42 -DZMK_CONFIG="/workspaces/zmk-config/config" -DOVERLAY_CONFIG="/workspaces/zmk-config/config/kan42.config"
NORMAL_BUILD_ARGS = $(COMMON_BUILD_ARGS) -DCONFIG_ZMK_STUDIO=n -DCONFIG_ZMK_STUDIO_LOCKING=n
STUDIO_BUILD_ARGS = $(COMMON_BUILD_ARGS) -DCONFIG_ZMK_STUDIO=y -DCONFIG_ZMK_STUDIO_LOCKING=n
container_name = $(shell docker ps --format '{{.Image}} {{.Names}}' | grep zmk | awk '{print $$2}')

.PHONY: build build-studio clean

build: $(TARGET)

$(TARGET): $(SRCS)
	docker exec -w /workspaces/zmk/app -it $(container_name) west build $(NORMAL_BUILD_ARGS)

build-studio: $(SRCS)
	docker exec -w /workspaces/zmk/app -it $(container_name) west build -p always $(STUDIO_BUILD_ARGS)

clean:
	docker exec -it $(container_name) rm -rf /workspaces/zmk/app/build
