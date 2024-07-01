# Define the names of your devices
$device1 = "Speakers"
$device2 = "Headphones"

# Function to get the current default audio playback device
function Get-DefaultAudioPlaybackDevice {
    $deviceEnumerator = New-Object -ComObject MMDeviceEnumerator
    $deviceEnumerator.GetDefaultAudioEndpoint(0, 1).FriendlyName
}

# Function to set the default audio playback device
function Set-DefaultAudioPlaybackDevice {
    param (
        [string]$deviceName
    )

    $deviceEnumerator = New-Object -ComObject MMDeviceEnumerator
    $deviceCollection = $deviceEnumerator.EnumAudioEndpoints(0, 1)

    for ($i = 0; $i -lt $deviceCollection.Count; $i++) {
        $device = $deviceCollection.Item($i)
        if ($device.FriendlyName -eq $deviceName) {
            $deviceCollection.Item($i).Activate([ref]([Guid]::Parse("{79eacaec-d6c5-4db4-b2f6-2ad7d9b7d34f}")), 23, $null, [ref]$null).SetDefaultEndpoint(0, 1)
            return
        }
    }

    Write-Host "Device '$deviceName' not found."
}

# Get the current default audio playback device
$currentDevice = Get-DefaultAudioPlaybackDevice

Write-Host "Current device: $currentDevice"

# Toggle the default audio playback device
if ($currentDevice -eq $device1) {
    Write-Host "Switching to $device2"
    Set-DefaultAudioPlaybackDevice -deviceName $device2
} else {
    Write-Host "Switching to $device1"
    Set-DefaultAudioPlaybackDevice -deviceName $device1
}

Write-Host "Audio device switched."
