# 🐳 Sky130 開發環境 Docker 鏡像

這個Docker鏡像包含了完整的Sky130開發環境，包括所有必要的工具和庫。

## 📦 鏡像信息

- **鏡像名稱**: `ghcr.io/jerryleerbay/sky130repo`
- **基礎鏡像**: Ubuntu 22.04
- **架構支持**: linux/amd64, linux/arm64
- **大小**: 約 2-3GB

## 🚀 快速開始

### 拉取鏡像
```bash
docker pull ghcr.io/jerryleerbay/sky130repo:latest
```

### 運行容器
```bash
# 基本運行
docker run -it --rm ghcr.io/jerryleerbay/sky130repo:latest

# 掛載工作目錄
docker run -it --rm -v $(pwd):/workspace ghcr.io/jerryleerbay/sky130repo:latest

# 運行特定命令
docker run --rm ghcr.io/jerryleerbay/sky130repo:latest yosys --version
```

## 🛠️ 包含的工具

- **SkyWater PDK**: `/opt/skywater-pdk`
- **Magic VLSI**: `/opt/magic/bin/magic`
- **Yosys**: `/opt/yosys/bin/yosys`
- **Netgen**: `/opt/netgen/bin/netgen`
- **Xschem**: `/opt/xschem-editor`
- **KLayout**: `/opt/klayout/klayout`

## 🔧 環境變量

- `PDK_ROOT=/opt/skywater-pdk`
- `MAGIC_ROOT=/opt/magic`
- `YOSYS_ROOT=/opt/yosys`
- `NETGEN_ROOT=/opt/netgen`
- `KLAYOUT_ROOT=/opt/klayout`

## 📝 使用示例

### 1. 啟動Magic VLSI
```bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ghcr.io/jerryleerbay/sky130repo:latest magic
```

### 2. 運行Yosys綜合
```bash
docker run -it --rm -v $(pwd):/workspace ghcr.io/jerryleerbay/sky130repo:latest yosys -p "read_verilog /workspace/design.v; synth; write_verilog /workspace/synthesized.v"
```

### 3. 查看GDS文件
```bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/workspace ghcr.io/jerryleerbay/sky130repo:latest klayout /workspace/design.gds
```

## 🔄 自動構建

這個鏡像通過GitHub Actions自動構建：

- **觸發條件**: 推送到master分支或創建tag
- **構建平台**: GitHub Actions
- **發布位置**: GitHub Container Registry (ghcr.io)
- **多架構**: 支持AMD64和ARM64

## 📋 標籤說明

- `latest`: 最新版本（master分支）
- `v1.0.0`: 版本標籤
- `master`: 分支標籤

## 🤝 貢獻

歡迎提交Issue和Pull Request來改進這個Docker鏡像！

## 📄 許可證

遵循各個工具的原始許可證。
