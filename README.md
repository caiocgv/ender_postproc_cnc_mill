# Ender CNC Mill Post-Processor

A G-code post-processor for CNC milling, laser, and plasma cutting operations using Marlin 2.0 firmware. This post-processor is designed for use with CAM software (such as Autodesk Fusion 360 or Inventor CAM) to generate G-code compatible with 3D printers converted to CNC mills, particularly the Ender series.

## Overview

This post-processor converts CAM toolpaths into G-code compatible with Marlin 2.0 firmware, enabling 3D printers to perform CNC milling, laser cutting, and plasma cutting operations. It's based on the [MPCNC posts processor](https://github.com/guffy1234/mpcnc_posts_processor) and adapted for DIY CNC applications.

## Features

- **Multiple Operation Modes:**
  - CNC Milling with spindle control
  - Laser cutting/engraving
  - Plasma cutting

- **Firmware Support:**
  - Marlin 2.0 / Repetier 1.0.3
  - GRBL 1.1
  - RepRap firmware (Duet)

- **Advanced Capabilities:**
  - Tool change support with LCD display integration
  - Automatic Z-probing before operations
  - Arc movement support (G2/G3)
  - Customizable travel speeds for X/Y/Z axes
  - Coolant control (dual channel support)
  - Origin setting and return-to-origin on completion

## Installation

### For Autodesk Fusion 360 / Inventor CAM

1. Download the following files:
   - `marlin_cnc_marlin20.cps`
   - `marlin_cnc_common.js`

2. Copy both files to your CAM post-processor directory:
   - **Windows:** `%LOCALAPPDATA%\Autodesk\Fusion 360 CAM\Posts\`
   - **Mac:** `~/Library/Application Support/Autodesk/Fusion 360 CAM/Posts/`
   - **Inventor CAM:** `C:\Users\Public\Documents\Autodesk\Inventor CAM [version]\Posts\`

3. Restart your CAM software

4. Select "Marlin CNC Milling/Laser - Marlin 2.0" from the post-processor list when setting up your CAM operations

## Configuration

The post-processor offers extensive configuration options that can be adjusted in your CAM software's post-processor settings:

### Job Settings

- **Travel Speeds:** Configure X/Y and Z travel speeds for non-cutting movements
- **Arc Support:** Enable/disable G2/G3 arc commands
- **Origin Control:** Set origin on start (G92) and return to origin on finish
- **Spindle Control:** Manual or automatic spindle on/off

### Tool Change Settings

- **Tool Change Position:** X, Y, Z coordinates for tool changes
- **Z-Probe After Change:** Automatically probe Z-height after tool changes
- **Z-Stepper Control:** Option to disable Z stepper during tool changes

### Probing Options

- **Probe on Start:** Execute probing routine at job start
- **Probe Thickness:** Thickness of the probe plate
- **Probe Method:** Choose between G28 (home) or G38 (probe) commands
- **Probe Speed:** Speed for probing operations

### Laser/Plasma Cutting

- **Power Levels:** Configure power percentages for different cutting modes:
  - Vaporize mode (default: 100%)
  - Through mode (default: 80%)
  - Etch mode (default: 40%)
- **Control Mode:** Select appropriate M-code for your laser/plasma cutter

### Custom G-code Files

You can specify custom G-code files for:
- Job start/header
- Job end/footer
- Tool changes
- Probing routines

## Usage

1. Create your CAM toolpaths in Fusion 360 or Inventor CAM
2. Select the "Marlin CNC Milling/Laser - Marlin 2.0" post-processor
3. Configure the post-processor settings according to your machine setup
4. Generate the G-code
5. Transfer the G-code to your CNC machine via SD card or USB
6. Run the G-code on your Marlin 2.0 powered CNC machine

## Supported Machines

This post-processor is designed for DIY CNC conversions of 3D printers, including:
- Ender 3 series converted to CNC mills
- MPCNC (Mostly Printed CNC)
- Other 3D printer-based CNC machines running Marlin 2.0

## Requirements

- CAM software (Autodesk Fusion 360, Inventor CAM, or compatible)
- CNC machine running Marlin 2.0, GRBL 1.1, or RepRap firmware
- Basic understanding of G-code and CNC operations

## Credits

This post-processor is based on the excellent work from the [MPCNC posts processor project](https://github.com/guffy1234/mpcnc_posts_processor) by guffy1234.

## License

Please refer to the original [MPCNC posts processor](https://github.com/guffy1234/mpcnc_posts_processor) for licensing information.

## Safety Notice

⚠️ **Important Safety Information:**
- Always verify G-code before running on your machine
- Start with air cuts to test toolpaths
- Ensure proper workholding and machine setup
- Use appropriate safety equipment (eye protection, hearing protection, etc.)
- Never leave your CNC machine unattended during operation
- Laser cutting requires proper eye protection and ventilation

## Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page or submit pull requests.

## Support

For questions or support, please open an issue on the GitHub repository.
