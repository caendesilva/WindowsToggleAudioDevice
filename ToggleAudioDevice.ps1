Import-Module AudioDeviceCmdlets

# Define the indices of your devices
$device1Index = 3
$device2Index = 4

# Get the current default audio playback device index
$currentDeviceIndex = (Get-AudioDevice -Playback | Where-Object { $_.Default -eq "True" }).Index

Write-Host "Current device index: $currentDeviceIndex"

# Function to set the default audio playback device by index
function Set-DefaultAudioDeviceByIndex {
    param (
        [int]$deviceIndex
    )

    Set-AudioDevice -Index $deviceIndex
    Write-Host "Switched to device index $deviceIndex."
}

# Toggle the default audio playback device
if ($currentDeviceIndex -eq $device1Index) {
    Set-DefaultAudioDeviceByIndex -deviceIndex $device2Index
} else {
    Set-DefaultAudioDeviceByIndex -deviceIndex $device1Index
}
