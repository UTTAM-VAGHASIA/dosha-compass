# Ayurvedic Prakriti Assessment (Dosha Compass)

An Ayurvedic prakriti (constitution) assessment built with Flutter. The app walks users through a guided questionnaire, calculates their dominant dosha profile, and delivers personalized wellness insights grounded in traditional Ayurvedic principles.

## Table of Contents

- [Ayurvedic Prakriti Assessment (Dosha Compass)](#ayurvedic-prakriti-assessment-dosha-compass)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Key Features](#key-features)
  - [Tech Stack](#tech-stack)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Windows](#windows)
    - [macOS \& Linux](#macos--linux)
    - [Optional: Device Preview](#optional-device-preview)

## Overview

The application helps users understand their Ayurvedic constitution by:

- Collecting responses to 21 curated questions across physical, mental, lifestyle, and environmental categories.
- Scoring each response against Vata, Pitta, and Kapha doshas using a weighted engine.
- Presenting clear results, including dosha balance charts, key traits, and tailored recommendations.
- Persisting assessment history locally so users can review their journey over time.

## Key Features

- **Guided Assessment:** Step-by-step questionnaire with progress tracking and contextual explanations.
- **Dynamic Result Analysis:** Combines dosha scores to identify single, dual, or tri-doshic prakriti types.
- **Dosha Balance:** Visual representation of dosha percentages and trends over time.
- **Personalized Recommendations:** Lifestyle, diet, and mindfulness tips mapped to the identified prakriti.
- **History & Insights:** View past assessments, track trends, and explore summary statistics.
- **Adaptive Theming:** Toggle between light/dark modes with persisted preferences in multiple screens.
- **Multi-device Development:** Device Preview integration to simulate layouts during development.

## Tech Stack

- **Flutter (via FVM)** targeting version `3.35.7`
- **GetX** for routing, dependency injection, and reactive state
- **Shared Preferences** for lightweight local persistence
- **Device Preview** (disabled in production builds) to assist during development
- **Material 3** UI with custom theming

Refer to [`pubspec.yaml`](pubspec.yaml) for the full dependency list.

## Getting Started

### Prerequisites

- Simply run as a windows desktop app or web app for testing.
- Basic Flutter tooling (via FVM or a direct Flutter installation).

### Windows

1. **Install Chocolatey** (if not already installed):
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```

2. **Install FVM via Chocolatey (optional if Flutter is already installed)**:
   ```powershell
   choco install fvm
   ```

3. **Restart your terminal** in the project root and choose one of the following paths:

   - **Use existing Flutter installation** (already at version `3.35.7`):
     ```powershell
     flutter run -d windows
     ```

   - **Manage Flutter with FVM** (recommended when Flutter is missing or on a different version):
     ```powershell
     fvm install 3.35.7 -s
     fvm use 3.35.7
     fvm flutter run -d windows
     ```

### macOS & Linux

1. **Install FVM**:
   ```sh
   dart pub global activate fvm
   ```

2. **Install and select the pinned Flutter version**:
   ```sh
   fvm install 3.35.7
   fvm use 3.35.7
   fvm flutter doctor
   ```

3. **Install dependencies**:
   ```sh
   fvm flutter pub get
   ```

4. **Run the app**:
   ```sh
   fvm flutter run
   ```

### Optional: Device Preview

To experiment with different breakpoints locally, enable Device Preview in development by toggling `DevicePreview(enabled: true, ...)` inside `main.dart`.