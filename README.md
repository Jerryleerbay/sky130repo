# Sky130 完整開發環境

這個倉庫包含了Sky130 PDK相關的完整開發工具鏈集合。

## 🚀 快速開始

### 主倉庫
- **主倉庫**: [sky130repo](https://github.com/Jerryleerbay/sky130repo) - 開發環境集合

### 核心工具倉庫

#### 1. SkyWater PDK
- **倉庫**: [skywater-pdk](https://github.com/Jerryleerbay/skywater-pdk)
- **描述**: 完整的SkyWater 130nm工藝設計套件
- **用途**: 提供標準單元庫、PDK文件、設計規則等

#### 2. Magic VLSI Layout Editor
- **倉庫**: [magic-vlsi](https://github.com/Jerryleerbay/magic-vlsi)
- **描述**: 專業的VLSI佈局編輯器
- **用途**: 電路佈局設計、DRC檢查、LVS驗證

#### 3. Netgen
- **倉庫**: [netgen-tool](https://github.com/Jerryleerbay/netgen-tool)
- **描述**: 網表生成和驗證工具
- **用途**: 網表比較、LVS驗證、電路分析

#### 4. Xschem
- **倉庫**: [xschem-editor](https://github.com/Jerryleerbay/xschem-editor)
- **描述**: 電路圖編輯器
- **用途**: 電路圖設計、符號庫管理

#### 5. Yosys
- **倉庫**: [yosys-synthesis](https://github.com/Jerryleerbay/yosys-synthesis)
- **描述**: 開源綜合工具
- **用途**: RTL綜合、優化、技術映射

#### 6. KLayout
- **倉庫**: [klayout-viewer](https://github.com/Jerryleerbay/klayout-viewer)
- **描述**: 專業的佈局查看和編輯工具
- **用途**: GDS查看、佈局編輯、DRC檢查

## 📦 安裝和使用

### 方法1: 克隆所有倉庫
```bash
# 克隆主倉庫
git clone https://github.com/Jerryleerbay/sky130repo.git
cd sky130repo

# 克隆各個工具倉庫
git clone https://github.com/Jerryleerbay/skywater-pdk.git
git clone https://github.com/Jerryleerbay/magic-vlsi.git
git clone https://github.com/Jerryleerbay/netgen-tool.git
git clone https://github.com/Jerryleerbay/xschem-editor.git
git clone https://github.com/Jerryleerbay/yosys-synthesis.git
git clone https://github.com/Jerryleerbay/klayout-viewer.git
```

### 方法2: 使用子模組（推薦）
```bash
# 克隆主倉庫並初始化子模組
git clone --recursive https://github.com/Jerryleerbay/sky130repo.git
cd sky130repo

# 更新所有子模組
git submodule update --init --recursive
```

## 🛠️ 開發環境設置

1. **安裝依賴**:
   ```bash
   sudo apt update
   sudo apt install build-essential cmake git tcl-dev tk-dev
   ```

2. **編譯各個工具**:
   - 參考各個倉庫的README文件
   - 按照標準的configure/make流程編譯

3. **環境變量設置**:
   ```bash
   export PDK_ROOT=/path/to/skywater-pdk
   export MAGIC_ROOT=/path/to/magic-vlsi
   export YOSYS_ROOT=/path/to/yosys-synthesis
   ```

## 📚 文檔和資源

- [SkyWater PDK 官方文檔](https://skywater-pdk.readthedocs.io/)
- [Magic 用戶手冊](https://github.com/RTimothyEdwards/magic)
- [Yosys 文檔](https://yosyshq.net/yosys/)
- [KLayout 文檔](https://www.klayout.org/)

## 🤝 貢獻

歡迎提交Issue和Pull Request來改進這個開發環境！

## 📄 許可證

各個工具遵循其原始許可證。請查看各個倉庫的LICENSE文件。

---

**注意**: 這個倉庫集合了Sky130開發所需的所有核心工具，為您提供完整的開源VLSI設計環境。
