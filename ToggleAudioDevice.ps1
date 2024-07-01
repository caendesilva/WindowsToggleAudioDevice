Import-Module AudioDeviceCmdlets

# Define the names of your devices
$device1 = "Speakers"
$device2 = "Headphones"

# Get the current default audio playback device
$currentDevice = (Get-AudioDevice -Playback | Where-Object { $_.Default -eq "True" }).Name

Write-Host "Current device: $currentDevice"

# Function to set the default audio playback device
function Set-DefaultAudioDevice {
    param (
        [string]$deviceName
    )

    $device = Get-AudioDevice -Playback | Where-Object { $_.Name -eq $deviceName }
    if ($device) {
        Set-DefaultAudioDevice -PlaybackDevice $device
        Write-Host "Switched to $deviceName"
    } else {
        Write-Host "Device '$deviceName' not found."
    }
}

# Toggle the default audio playback device
if ($currentDevice -eq $device1) {
    Set-DefaultAudioDevice -deviceName $device2
} else {
    Set-DefaultAudioDevice -deviceName $device1
}

Write-Host "Audio device switched."
