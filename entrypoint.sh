#!/bin/bash

# Sky130 開發環境啟動腳本

echo "🚀 啟動 Sky130 開發環境..."
echo "=================================="

# 設置環境變量
export PDK_ROOT=/opt/skywater-pdk
export MAGIC_ROOT=/opt/magic
export YOSYS_ROOT=/opt/yosys
export NETGEN_ROOT=/opt/netgen
export KLAYOUT_ROOT=/opt/klayout

# 添加到PATH
export PATH=$PATH:$MAGIC_ROOT/bin:$YOSYS_ROOT/bin:$NETGEN_ROOT/bin:$KLAYOUT_ROOT

# 顯示環境信息
echo "📁 工作目錄: $(pwd)"
echo "🔧 已安裝工具:"
echo "  - SkyWater PDK: $PDK_ROOT"
echo "  - Magic VLSI: $MAGIC_ROOT"
echo "  - Yosys: $YOSYS_ROOT"
echo "  - Netgen: $NETGEN_ROOT"
echo "  - KLayout: $KLAYOUT_ROOT"
echo ""

# 檢查工具是否可用
echo "🔍 檢查工具狀態:"
if command -v magic &> /dev/null; then
    echo "  ✅ Magic VLSI: $(magic -V 2>&1 | head -1)"
else
    echo "  ❌ Magic VLSI: 未找到"
fi

if command -v yosys &> /dev/null; then
    echo "  ✅ Yosys: $(yosys -V 2>&1 | head -1)"
else
    echo "  ❌ Yosys: 未找到"
fi

if command -v netgen &> /dev/null; then
    echo "  ✅ Netgen: $(netgen -V 2>&1 | head -1)"
else
    echo "  ❌ Netgen: 未找到"
fi

if command -v klayout &> /dev/null; then
    echo "  ✅ KLayout: $(klayout -v 2>&1 | head -1)"
else
    echo "  ❌ KLayout: 未找到"
fi

echo ""
echo "💡 使用提示:"
echo "  - 運行 'magic' 啟動 Magic VLSI 編輯器"
echo "  - 運行 'yosys' 啟動 Yosys 綜合工具"
echo "  - 運行 'netgen' 啟動 Netgen 工具"
echo "  - 運行 'klayout' 啟動 KLayout 查看器"
echo "  - PDK 文件位於: $PDK_ROOT"
echo ""

# 如果提供了命令參數，執行它
if [ $# -gt 0 ]; then
    echo "🎯 執行命令: $@"
    exec "$@"
else
    echo "🐚 進入交互式 shell..."
    exec bash
fi
