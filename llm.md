> Investigations on a possible local LLM to replace Alexa

Local AI Voice Assistant with Home Assistant

A practical guide to building a private, Alexa-like voice assistant using free and self-hosted software.

1. Goal

Build a completely local voice assistant capable of:

Answering general knowledge questions
Holding natural conversations
Controlling Home Assistant devices
Executing automations
Running entirely on your own server
Operating without cloud services or subscriptions

The design separates the voice endpoint (microphone and speaker) from the AI server, allowing inexpensive voice devices to leverage a centralized AI backend.

High-Level Architecture
flowchart TD
    Voice["Voice Device<br/>(Mic + Speaker)"]
    STT["Speech-to-Text<br/>(Faster Whisper)"]
    LLM["Local LLM<br/>(Ollama)"]
    HA["Home Assistant"]
    TTS["Text-to-Speech<br/>(Piper)"]

    Voice --> STT
    STT --> LLM
    LLM --> HA
    HA --> TTS
    TTS --> Voice


The voice device only captures audio and plays responses. All speech recognition, reasoning, automation, and speech synthesis are performed on the server.

2. Recommended Free Software Stack
Component	Purpose
Home Assistant	Smart home platform, automation engine, and tool execution
Ollama	Runs local LLMs and exposes an API
Faster-Whisper	Local Speech-to-Text
Piper	Local Text-to-Speech
OpenWakeWord	Local wake word detection
ESPHome	Connects ESP32-based voice devices to Home Assistant
Recommended Models
Model	Recommended For
Qwen 3 4B	Best overall balance
Gemma 3 4B	Excellent alternative
Llama 3.2 3B	Lower-end hardware
Mistral 7B	Higher-end systems
3. Recommended Voice Hardware
Home Assistant Voice Preview Edition
Advantages
High-quality microphone array
Integrated speaker
Native ESPHome support
Designed specifically for Home Assistant
Minimal setup
Drawbacks
More expensive than DIY alternatives
ESP32-S3 Voice Kits

Examples:

ESP32-S3-BOX-3
M5Stack Atom Echo
Advantages
Very affordable
Wi-Fi connectivity
Microphone support
Speaker support
Ideal for deploying multiple rooms
4. Overall System Architecture
flowchart TB

    subgraph Proxmox Server
        HA["Home Assistant"]
        OLLAMA["Ollama<br/>Qwen / Gemma"]
        STT["Faster Whisper"]
        TTS["Piper"]
    end

    Voice["ESP32 / Voice Preview Edition"]

    Voice --> STT
    STT --> OLLAMA
    OLLAMA --> HA
    HA --> TTS
    TTS --> Voice

5. Request Processing Flow

Example request:

"Turn off every downstairs light."

sequenceDiagram
    participant User
    participant Voice as Voice Device
    participant Whisper as Faster Whisper
    participant LLM as Ollama
    participant HA as Home Assistant
    participant Piper

    User->>Voice: Speak command
    Voice->>Whisper: Audio stream
    Whisper->>LLM: Transcribed text
    LLM->>HA: Execute light.turn_off()
    HA-->>LLM: Success
    LLM->>Piper: Generate response
    Piper->>Voice: Play confirmation

6. Home Assistant Integration

The LLM should never directly manipulate devices.

Instead, Home Assistant exposes entities, services, and scripts as tools that the LLM can invoke.

Example: "Good night"
flowchart LR
    User["User: Good night"] --> LLM

    LLM -->|"Call script.good_night"| HA

    HA --> Lights["Turn off lights"]
    HA --> Doors["Lock doors"]
    HA --> Alarm["Arm alarm"]
    HA --> Climate["Lower thermostat"]


The automation encapsulates the logic, while the LLM simply decides which automation to execute.

Example: "Movie time"

The LLM calls a Home Assistant script that:

Closes blinds
Dims lights
Powers on the TV
Selects the correct HDMI input
Turns on the AV receiver
7. Capabilities
General AI
Answer questions
Explain concepts
Hold conversations
Summarize information
Translate text
Brainstorm ideas
Home Automation
Control lights
Manage thermostats
Lock or unlock doors
Query sensors
Operate media players
Open garage doors
Activate scenes
Combined Tasks

Example:

"I'm going to bed."

The assistant could:

Turn off lights
Lock doors
Arm the alarm
Adjust the thermostat
Read tomorrow's weather forecast

Example:

"I'm leaving for work."

The assistant could:

Close the garage
Turn off unnecessary devices
Arm the security system
Read today's calendar
Report traffic conditions
8. Recommended Local Models
Model	Notes
Llama 3.2 3B	Fastest, ideal for entry-level hardware
Qwen 3 4B	Best balance of speed and reasoning
Gemma 3 4B	Excellent alternative
Mistral 7B	Better quality, requires more resources
9. Current Hardware Assessment

Current server:

Intel i5
16 GB RAM
2 GB GPU

Suitable for:

Home Assistant
Faster Whisper
Piper
Qwen 3 4B
Gemma 3 4B

The 2 GB GPU is insufficient for meaningful LLM acceleration, so inference will primarily run on the CPU.

10. Future Hardware Improvements
1. Upgrade RAM (Highest Priority)

16 GB → 32 GB

Benefits:

Larger models
More simultaneous services
Increased context sizes
Better multitasking
2. Upgrade GPU
Best Value

RTX 3060 12 GB

Benefits:

GPU inference for 7B–8B models
Significantly faster responses
Excellent price-to-performance ratio
Higher-End

RTX 4060 Ti 16 GB

Benefits:

Supports larger 14B-class models
Better conversational quality
Improved future compatibility
Used Server Hardware

Tesla P40 24 GB

Pros:

Large VRAM
Affordable second-hand
Excellent for quantized LLMs

Cons:

High power consumption
Requires adequate cooling
No display outputs
3. Upgrade CPU

Recommended only if the current Intel i5 is an older generation.

A newer CPU improves:

Faster Whisper
Piper
CPU-based inference
Overall responsiveness

If a capable GPU is installed, CPU performance becomes less critical for LLM inference.

11. Multi-Room Deployment

One AI server can power multiple voice endpoints.

flowchart LR

    Kitchen["Kitchen Voice Device"] --> Server
    Bedroom["Bedroom Voice Device"] --> Server
    Office["Office Voice Device"] --> Server
    Garage["Garage Voice Device"] --> Server

    Server["Proxmox Server<br/>Home Assistant<br/>Ollama<br/>Whisper<br/>Piper"]


Each room only requires:

Microphone
Speaker
Wi-Fi connectivity

All processing remains centralized.

12. Suggested Deployment Roadmap
Phase 1 — Core Services
Install Home Assistant
Install Ollama
Install Faster Whisper
Install Piper
Test a local 4B model
Phase 2 — Voice Hardware
Deploy a Home Assistant Voice Preview Edition or ESP32-S3 voice kit
Configure OpenWakeWord
Verify speech recognition and synthesis
Phase 3 — Smart Home Integration
Expose Home Assistant entities and scripts to the LLM
Create reusable automations:
good_night
movie_time
leaving_home
Prefer high-level scripts over individual device commands
Phase 4 — Advanced Features
Add long-term memory (optional)
Implement Retrieval-Augmented Generation (RAG) for local documents and notes
Deploy additional voice endpoints throughout the home
Final Recommended Stack
flowchart LR

    Voice["Voice Device"]
    Wake["OpenWakeWord"]
    Whisper["Faster Whisper"]
    Ollama["Ollama<br/>Qwen 3 4B / Gemma 3 4B"]
    HA["Home Assistant"]
    Piper["Piper"]

    Voice --> Wake
    Wake --> Whisper
    Whisper --> Ollama
    Ollama --> HA
    HA --> Piper
    Piper --> Voice

Software
Home Assistant — Home automation and orchestration
Ollama — Local LLM runtime
Qwen 3 4B (recommended) or Gemma 3 4B
Faster Whisper — Speech-to-Text
Piper — Text-to-Speech
OpenWakeWord — Wake word detection
Voice Endpoints
Home Assistant Voice Preview Edition (recommended)
ESP32-S3 Voice Kit (budget option)
Hardware Upgrade Path
Upgrade to 32 GB RAM
Add an RTX 3060 12 GB (best value) or larger GPU
Upgrade the CPU only if it becomes a bottleneck

This architecture is modular, fully self-hosted, and scalable. As your hardware improves, you can run increasingly capable language models while keeping the same overall software stack and deployment model.

