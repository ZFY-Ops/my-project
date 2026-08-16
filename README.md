# My Project - 2D Competitive Fighting Game

基于 [Sakuga-Engine](https://github.com/NoisyChain/Sakuga-Engine) (Godot 4 + C#) 二次开发的竞技格斗游戏，类似拳皇的 2D 对战游戏。

## 功能特性

- **2D 格斗对战** — 1P vs CPU、1P vs 2P 本地对战
- **在线对战** — 基于 Rollback 网络代码的在线对战
- **角色系统** — 数据驱动的角色设计，包含招式、状态、AI
- **自定义角色** — 新增 Shadow Warrior 角色（基于 Kaede 模板）
- **自定义场景** — AI 生成的 Sunset Rooftop 和 Neon City 场景
- **自定义着色器** — 闪白打击特效、CRT 扫描线滤镜
- **AI 生成美术资源** — 场景背景、UI 素材、VFX 特效贴图
- **游戏模式** — 街机、对战、训练、在线、回放

## 环境要求

| 组件 | 版本 | 说明 |
|------|------|------|
| Godot Engine | 4.7.1+ .NET (mono) | 必须是 .NET 版本 |
| .NET SDK | 8.0+ | C# 编译支持 |
| 操作系统 | Windows / Linux / macOS | 跨平台 |

## 快速开始

### 1. 打开项目

```bash
# 使用 Godot 编辑器打开项目
Godot_v4.7.1-stable_mono_win64.exe --path .
```

或双击 `project.godot` 文件用 Godot 编辑器打开。

### 2. 运行游戏

- 在 Godot 编辑器中按 `F5` 运行
- 或通过命令行启动：
```bash
Godot_v4.7.1-stable_mono_win64.exe --path . --main-scene res://Scenes/MainMenu.tscn
```

### 3. 操作说明

| 操作 | 键盘 (P1) | 键盘 (P2) |
|------|-----------|-----------|
| 移动 | A / D | 方向键 ← / → |
| 蹲下 | S | 方向键 ↓ |
| 跳跃 | W | 方向键 ↑ |
| 轻攻击 | J | 小键盘 1 |
| 重攻击 | K | 小键盘 2 |
| 特殊技 | L | 小键盘 3 |
| 必杀技 | I + 方向 | 小键盘 0 + 方向 |
| 暂停 | Enter | Enter |

## 项目结构

```
my-project/
├── Fighters/                 # 角色目录
│   ├── Kaede/               # 原始角色 Kaede Hioh
│   ├── Shadow/              # 自定义角色 Shadow Warrior
│   ├── Dummy/               # 测试用 Dummy
│   └── Shared/              # 共享角色资源
├── Stages/                   # 场景目录
│   ├── Sunset_Rooftop/      # [自定义] 日落天台场景
│   ├── Neon_City/           # [自定义] 霓虹都市场景
│   ├── Sakuga Default/      # 默认场景
│   └── AFF_Legacy/          # 遗留 3D 场景
├── Scenes/                   # 游戏场景
│   ├── MainMenu.tscn        # 主菜单
│   ├── SelectScreen.tscn    # 选人界面
│   └── ...
├── Scripts/                  # C# 源代码
│   └── SakugaEngine/        # 引擎核心代码
├── Shaders/                  # 着色器
│   ├── color_palette.gdshader      # 颜色替换（原始）
│   ├── hit_flash.gdshader          # [自定义] 打击闪白特效
│   └── scanline.gdshader           # [自定义] CRT 扫描线滤镜
├── Sprites/                  # 共享精灵图
│   ├── VFX_Custom/          # [自定义] AI 生成 VFX 贴图
│   └── UI_Custom/           # [自定义] AI 生成 UI 素材
├── GameModes/                # 游戏模式配置
├── Songs/                    # 音乐文件
├── Prototyping/              # 原型设计文件
└── project.godot             # Godot 项目配置
```

## 自定义内容

### 新增角色：Shadow Warrior

基于 Kaede 模板创建的角色，包含完整的：
- 30+ 动画数据文件
- 完整招式系统（轻攻击、重攻击、特殊技、必杀技）
- AI 行为配置（简单/中等难度）
- 受击状态、空中连招、倒地恢复
- 颜色配色方案

### 新增场景

| 场景 | 风格 | 来源 |
|------|------|------|
| Sunset Rooftop | 日落天台 | AI 生成 |
| Neon City | 霓虹都市夜景 | AI 生成 |

### 自定义着色器

- **hit_flash.gdshader** — 受击时角色闪白效果，可调节闪烁颜色和强度
- **scanline.gdshader** — CRT 复古扫描线滤镜，营造街机厅氛围

### AI 生成美术资源

| 资源 | 类型 | 用途 |
|------|------|------|
| Sunset Rooftop BG | 场景背景 | 日落天台场景 |
| Neon City BG | 场景背景 | 霓虹都市场景 |
| Hit Impact | VFX 贴图 | 打击特效 |
| Slash Effect | VFX 贴图 | 斩击特效 |
| Block Effect | VFX 贴图 | 格挡特效 |
| Charge Aura | VFX 贴图 | 蓄力特效 |
| Title Background | UI 背景 | 主菜单 |
| Health Bar | UI 元素 | 血条 |
| Fighter Portraits | 角色立绘 | 选人界面 |

## 开发指南

### 添加新角色

1. 复制 `Fighters/Shadow/` 目录并重命名
2. 修改 `XXX_Profile.tres` 中的 `FighterName` 和 `ShortName`
3. 在 `Sprites/` 目录替换角色精灵图
4. 在 `AnimationData/` 中调整动画帧数据
5. 在 `Moves/` 中配置招式参数
6. 在 `Stances/` 和 `States/` 中调整状态机

### 添加新场景

1. 在 `Stages/` 下创建新目录
2. 放入背景图片
3. 创建 `.tscn` 场景文件（参考 `sunset_rooftop.tscn`）
4. 在 Godot 编辑器中配置场景

### 修改着色器

在 `Shaders/` 目录下编辑 `.gdshader` 文件，参考 Godot Shader 文档：
- [Godot Shaders](https://docs.godotengine.org/en/stable/tutorials/shaders/index.html)

## 推荐免费素材资源

以下资源可用于进一步丰富游戏内容：

| 资源 | 类型 | 许可证 | 链接 |
|------|------|--------|------|
| Streets of Fight | 角色+场景 | CC0 | [OpenGameArt](https://opengameart.org/content/streets-of-fight) |
| Martial Hero | 角色精灵 | CC0 | [itch.io](https://luizmelo.itch.io/martial-hero) |
| Stick Figure Fighter | 角色精灵 | CC0 | [OpenGameArt](https://opengameart.org/content/animated-stick-figure-character-2d-free-cc0) |
| Deadly Kombat SFX | 音效 | 免费商用 | [itch.io](https://danielsoundsgood.itch.io/free-deadly-kombat-sound-effects) |
| Vacuous BGM | 音乐 | 免费商用 | [itch.io](https://vacuous2409.itch.io/) |

## 致谢

- **Sakuga-Engine** — [@NoisyChain](https://github.com/NoisyChain) 开发的开源格斗引擎
- **Godot Engine** — [godotengine.org](https://godotengine.org)
- **美术资源** — AI 生成 + CC0 开源素材

## 许可证

- 引擎代码：MIT License（继承自 Sakuga-Engine）
- AI 生成美术资源：免费使用
- Godot Engine：MIT License
