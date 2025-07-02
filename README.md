# Crab Island

## Overview
This project is a platformer game developed in MIPS Assembly. The game features multiple levels, moving obstacles, and double jump mechanics. Players must navigate through levels while avoiding enemies to reach the goal.
## Key Information
- **Author**: Lily Xiaomei Zhou
- 
## Setup Instructions
- **Download MIPs Simulator**: Download the .jar file Mars_Updated.jar
- **Download Game File**: Download the .asm file game.asm
- Launch the jar file, then open game.asm into the simulator.
- Go to **Tools -> Keyboard and Display MMIO Simulator**, then click **Connect to MIPS**
- Go to **Tools -> Bitmap Display** and set the configurations to the below specifications and then click **COnnect to MIPS**
### Bitmap Display Configuration
| Setting               | Value      |
|-----------------------|------------|
| Unit width in pixels  | 4          |
| Unit height in pixels | 4          |
| Display width         | 512 pixels |
| Display height        | 512 pixels |
| Base address          | 0x10008000 ($gp) |

### Implemented Features
1. **Moving Objects**: Dynamic enemies (ants) that traverse platforms
2. **Double Jump**: Perform a second jump while mid-air
3. **Multiple Levels**: Progressive stages with increasing difficulty
4. **Restart Mechanic**: Press 'r' to restart current level when playing, after passing a level, pressing 'r' will go to the next level 
5. **Level Progression**: Advance to next level after winning + restarting

## Gameplay Instructions
-To move, type your movements in the keyboard and Display MMIO Simulator
- **Movement**: 
  - 'a': Move left
  - 'd': Move right
  - 'w': Jump (press twice for double jump)
- **Objective**: Reach the goal platform (green) without touching enemies
- **Restart**: Press 'r' to reset current level
- **Progression**: After winning, pressing 'r' starts next level

## Demonstration Video
[![Gameplay Walkthrough](https://img.youtube.com/vi/-y8r_P1tO0Q/0.jpg)](https://youtu.be/-y8r_P1tO0Q)

## Sharing Permission
**Yes**, you may share the video demonstration and please include the project GitHub repository:  
[https://github.com/lilyxm/crab_island/](https://github.com/lilyxm/crab_island/)
