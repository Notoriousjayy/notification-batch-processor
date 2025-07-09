# Notification System Assessment

## Introduction

This project contains a scalable notification system with two primary microservices:
- **Notification API**: Receives notification requests and queues them.
- **Email Sender**: Processes messages from the queue and sends emails.

## Microservices Overview

### 1. Notification API
- **Location:** `apps/pt-notification-service/`
- **Tech Stack:** Node.js, NestJS
- **Purpose:** Exposes an HTTP API to receive notification requests (such as email notifications) from clients or other systems. Validates incoming requests and places them onto a message queue for asynchronous processing.
- **Key Files:**
  - `src/app/notification/notification.controller.ts` (handles incoming HTTP requests)
  - `src/app/notification/notification.service.ts` (business logic for queuing notifications)

### 2. Email Sender
- **Location:** `apps/pt-notification-service-infra-cdk/lambda/notification-processing/`
- **Tech Stack:** Node.js, AWS Lambda (handler function)
- **Purpose:** Consumes messages from the queue and processes them (e.g., sends emails).
- **Key File:**
  - `notification-processing-dummy.ts` (Lambda handler for processing SQS messages)

### Integration
- The Notification API and Email Sender communicate via a message queue (e.g., Amazon SQS or a local equivalent for testing).
- The system is designed for asynchronous, decoupled processing of notification requests.

---

## Assessment Task

**Your task is to design a complete AWS infrastructure solution for this notification system.**

### Requirements

1. **Analyze the Application**
   - Briefly describe the purpose and flow of each microservice.
   - Identify any dependencies or integration points between the services.

2. **Design the Cloud Architecture**
   - Propose a scalable, reliable, and secure AWS architecture to deploy both microservices.
   - You are free to choose any AWS services (e.g., ECS, Lambda, SQS, SNS, API Gateway, RDS, DynamoDB, etc.).
   - Consider best practices for:
     - Scalability and high availability
     - Security (IAM, secrets management, network isolation)
     - Observability (logging, monitoring, alerting)
     - Cost-effectiveness

3. **Plan the Deployment Strategy**
   - Consider and document how your deployment approach will address scalability, reliability, and security for the system.

4. **Create Dockerfiles**
   - Write Dockerfiles for the Notification microservices as part of your solution, or describe how you would containerize them for deployment.

5. **Diagram**
   - Create a clear architecture diagram (hand-drawn, diagram tool, or cloud architecture tool).
   - The diagram should show all major AWS components, data flows, and how the microservices interact.

6. **Justification**
   - Write a short explanation for each major design choice (e.g., why you chose ECS vs Lambda, SQS vs SNS, etc.).
   - Discuss how your design meets the requirements for scalability, reliability, and security.

7. **(Optional Bonus)**
   - Suggest a CI/CD approach for this system.
   - Propose strategies for zero-downtime deployments and disaster recovery.

---

## Deliverables

- **Architecture diagram** (image or PDF)
- **Written document**  covering:
  - Microservice analysis
  - AWS service selection and design rationale
  - Security, scalability, and observability considerations
  - Deployment strategy
  - Dockerfile/containerization approach
 

---

## What I Am Looking For

- Ability to understand and analyze an existing codebase
- Depth of AWS architectural knowledge
- Clarity and completeness of the proposed solution
- Justification of design decisions
- Communication skills (diagram and documentation)

---


