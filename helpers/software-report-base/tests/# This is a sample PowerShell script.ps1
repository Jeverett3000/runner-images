# This is a sample PowerShell script

# Function to get system information
function Get-SystemInfo {
    $os = Get-WmiObject -Class Win32_OperatingSystem
    $cpu = Get-WmiObject -Class Win32_Processor
    $memory = Get-WmiObject -Class Win32_PhysicalMemory

    $systemInfo = [PSCustomObject]@{
        OS          = $os.Caption
        OSVersion   = $os.Version
        Architecture = $os.OSArchitecture
        CPU         = $cpu.Name
        Cores       = $cpu.NumberOfCores
        MemoryGB    = [math]::round(($memory.Capacity | Measure-Object -Sum).Sum / 1GB, 2)
    }

    return $systemInfo
}

# Get and display system information
$info = Get-SystemInfo
$info | Format-List