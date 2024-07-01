# WindowsToggleAudioDevice

PowerShell script to toggle between two Windows audio output devices from the comand line

## Installation:

### Install [`AudioDeviceCmdlets`](https://github.com/frgnca/AudioDeviceCmdlets) Module

1. **Open PowerShell as Administrator**:
   - Press `Win + X` and select `Windows PowerShell (Admin)` or search for PowerShell in the Start menu and right-click to run it as administrator.

2. **Install the Module**:
   ```powershell
   Install-Module -Name AudioDeviceCmdlets -Repository PSGallery -Force
   ```

### List All Audio Devices

1. **List Audio Devices**:
   ```powershell
   Import-Module AudioDeviceCmdlets
   Get-AudioDevice -List
   ```

This command will list all audio devices with their IDs and names. Take note of the `Index` values as you will need them later.

### Download `ToggleAudioDevice.ps1`

Next, download the `ToggleAudioDevice.ps1` file from GitHub, preferably into your `$PATH`.

### Configure `ToggleAudioDevice.ps1`

Now, open the `ToggleAudioDevice.ps1` file and define the speaker indices found in the list above.

```powershell
# Define the indices of your devices
$device1Index = 3 # Headphones
$device2Index = 4 # Speakers
```

## Usage

Now you can run the `.\ToggleAudioDevice.ps1` script from PowerShell, and even bind it as a macro to your keyboard!
