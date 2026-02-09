# Auto-HighPerf
> Automated Windows Performance Changer for demanding applications.

## 🎯 Rationale
Developed to just enable the high-performance capability of a Windows PC when it is needed by demanding applications that the user can specify..

## 🏗️ Technical Stack
* **Language:** AutoHotkey (AHK)
* **Execution:** Windows Startup / Background Listener
* **Interoperability:** Windows Power Management API, Process/Thread Priority API

## 🛠️ Key Features
* **Dynamic Priority Scaling:** Instantly elevates process priority to "High" or "Realtime" upon detection of target binaries, while deprioritizing non-essential background tasks.
* **Power Schema Automation:** Forces the OS into the "High Performance" power plan when specific resource-heavy applications gain window focus.
* **Stutter Mitigation:** Silences specific Windows maintenance tasks and telemetry interrupts during active sessions to ensure consistent frame-times.

## 🚀 Usage
1. Compile or run `Auto-HighPerf.ahk`.
2. Place a shortcut in the Windows Startup folder (`shell:startup`) for persistent optimization.
