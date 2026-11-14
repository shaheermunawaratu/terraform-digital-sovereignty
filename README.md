# Terraform Digital Sovereignty and Infrastructure Security

## 1. Project Introduction

For this assignment, I developed a Policy-as-Code project using Terraform and HashiCorp Sentinel. My objective was to create security policies that could identify and prevent non-compliant cloud infrastructure configurations before deployment.

I worked through the assignment step by step, using ChatGPT as an interactive development assistant. Rather than asking it to complete everything at once, I gave it individual tasks, followed its guidance, tested the suggested solutions and shared errors whenever something did not work.

This README documents the development process, including the instructions I gave ChatGPT, its responses, the problems we encountered and how we resolved them.

## 2. Technologies Used

- Terraform – Infrastructure as Code.
- HashiCorp Sentinel – Policy-as-Code.
- Sentinel CLI v0.41.0 – Local policy testing.
- AWS – Cloud infrastructure provider.
- Git and GitHub – Version control and project management.
- Windows PowerShell – Development environment.
- OpenAI ChatGPT (GPT-6) – Development assistance and troubleshooting.

## 3. Repository Structure

I organised the project into separate folders to keep the Terraform configuration, Sentinel policies, test cases and evidence organised.

```text
terraform-digital-sovereignty/
│
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   ├── .terraform.lock.hcl
│   └── tfplan
│
├── policies/
│   ├── approved_instance_types.sentinel
│   ├── approved_aws_regions.sentinel
│   ├── encrypted_ebs_volumes.sentinel
│   ├── enforce_imdsv2.sentinel
│   ├── restrict_ssh_ingress.sentinel
│   ├── approved_terraform_sources.sentinel
│   └── test/
│
├── Screenshots/
└── README.md
```

## 4. Development Process and ChatGPT Interaction

The following sections explain how I approached the main tasks. The instructions are reconstructed summaries of my prompts, written to represent their meaning rather than presented as exact quotations.

### Task 1 – Understanding and setting up the project

**My instruction to ChatGPT:**

> "I need to complete my Terraform Digital Sovereignty assignment. First, help me understand what needs to be implemented and how we should organise the GitHub repository. Guide me one step at a time, give me the exact instructions, and wait for me to complete each step before moving forward."

**ChatGPT's response:**

ChatGPT helped me break the assignment into smaller tasks and plan the repository structure. It explained the purpose of Terraform, Sentinel policies, test files and screenshots. We organised the project so that the infrastructure configuration and policy implementation would remain separate.

### Task 2 – Creating the Terraform configuration

**My instruction to ChatGPT:**

> "Help me prepare the Terraform project for this assignment. I want the configuration to follow good practices, use AWS as the provider and include the required Terraform files. Explain what each file does and guide me through creating them."

**ChatGPT's response:**

ChatGPT helped me organise the Terraform configuration into provider, version, variable, main and output files. It also explained the purpose of the provider lock file and saved Terraform plan. We kept the configuration focused on demonstrating infrastructure policies rather than unnecessarily deploying resources.

### Task 3 – Installing and configuring Sentinel

**My instruction to ChatGPT:**

> "I am using Windows PowerShell. Help me install and configure Sentinel so I can run and test my policies locally. If a command does not work, explain the issue and give me the correct PowerShell instruction."

**ChatGPT's response:**

ChatGPT helped me locate the Sentinel executable, configure access to it through the Windows PATH and verify the installation. I successfully checked the installed Sentinel CLI version, which was v0.41.0.

### Task 4 – Restricting EC2 instance types

**My instruction to ChatGPT:**

> "Create a Sentinel policy that only allows approved AWS EC2 instance types. I want to allow t3.micro, t3.small and t3.medium. Also create passing and failing test cases so I can demonstrate that approved configurations are accepted and unapproved ones are rejected."

**ChatGPT's response:**

ChatGPT created the `approved_instance_types.sentinel` policy and its mock test files. It explained how the policy checks the configured instance type against the approved list. I ran the tests and verified both compliant and non-compliant scenarios.

### Task 5 – Restricting AWS deployment regions

**My instruction to ChatGPT:**

> "Create a Sentinel policy to restrict AWS deployments to approved geographical regions. I want to use Ireland, London, Frankfurt and Stockholm. Make sure the policy checks the configured AWS region and includes tests for both approved and unapproved regions."

**ChatGPT's response:**

ChatGPT helped implement the approved region allowlist and the corresponding tests. It also explained why geographical restrictions are important for digital sovereignty and why an approved AWS region alone cannot guarantee complete data residency.

### Task 6 – Enforcing EBS encryption

**My instruction to ChatGPT:**

> "I want to make sure that all EC2 root volumes and separately created EBS data volumes are encrypted. Create a Sentinel policy that checks both, and include a failing test for an unencrypted volume."

**ChatGPT's response:**

ChatGPT helped create the `encrypted_ebs_volumes.sentinel` policy. During development, we extended the checks beyond EC2 root volumes to include separately managed EBS volumes. Additional negative test cases were added to verify that unencrypted configurations were rejected.

### Task 7 – Enforcing IMDSv2

**My instruction to ChatGPT:**

> "Create a Sentinel policy that requires IMDSv2 for EC2 instances. The policy should reject an instance if its metadata configuration does not require tokens. Include passing and failing tests."

**ChatGPT's response:**

ChatGPT provided the policy logic to check the EC2 metadata configuration. It also helped prepare tests for configurations where tokens were required and where they were not.

### Task 8 – Restricting SSH access

**My instruction to ChatGPT:**

> "Create a policy that prevents unrestricted SSH access from the internet. It should block 0.0.0.0/0 and unrestricted IPv6 access. Also make sure it detects wider port ranges that include port 22, not just rules that use port 22 exactly."

**ChatGPT's response:**

ChatGPT helped implement the SSH ingress checks and improve the logic to detect port ranges containing port 22. We also created separate failing tests for unrestricted IPv4, unrestricted IPv6 and a wider port range containing SSH.

### Task 9 – Restricting Terraform provider sources

**My instruction to ChatGPT:**

> "Create a Sentinel policy that allows only the approved HashiCorp AWS provider source and the version constraint ~> 5.0. Use Terraform configuration data to check the actual provider configuration, and create passing and failing mock tests."

**ChatGPT's response:**

ChatGPT helped implement the policy using `tfconfig/v2`. It checked the provider source and version constraint against the approved values. We created tests to demonstrate that the AWS provider was accepted while an unapproved provider was rejected.

### Task 10 – Troubleshooting and correcting problems

**My instruction to ChatGPT:**

> "I am getting errors when running these commands or testing the policies. I will share the PowerShell output and the contents of my files. Please identify the actual problem, explain why it happened and give me a corrected solution. Do not move forward until we have verified the fix."

**ChatGPT's response:**

ChatGPT reviewed the errors and helped me correct issues involving PowerShell syntax, file contents, Sentinel test structures and policy logic. We checked the saved files before rerunning tests to make sure the changes had actually been applied.

### Task 11 – Managing the project through GitHub

**My instruction to ChatGPT:**

> "I want to keep every policy organised separately in GitHub. For each policy, guide me through creating a feature branch, adding the policy and tests, committing the changes, pushing them and creating a pull request. Do not skip the pull request and merge process."

**ChatGPT's response:**

ChatGPT guided me through the feature-branch workflow. Each policy was implemented, tested, committed and pushed separately. I created a pull request for each implementation and merged it into the main branch after completing the work.

### Task 12 – Final testing

**My instruction to ChatGPT:**

> "Now that all six policies have been implemented, help me run the complete Sentinel test suite. Check the output and tell me whether every policy and test case has passed."

**ChatGPT's response:**

ChatGPT guided me through running the complete test suite and reviewing the output. The final result showed that all six policies and 15 individual test cases passed.

## 5. Implemented Policies

The completed project contains six Sentinel policies.

| Policy | Security requirement |
|---|---|
| Approved instance types | Allows only `t3.micro`, `t3.small` and `t3.medium`. |
| Approved AWS regions | Restricts deployments to the selected geographical allowlist. |
| Encrypted EBS volumes | Requires encryption for root and separately managed EBS volumes. |
| Enforce IMDSv2 | Requires metadata tokens for EC2 instances. |
| Restrict SSH ingress | Blocks unrestricted IPv4 and IPv6 SSH access, including wider ranges containing port 22. |
| Approved Terraform sources | Restricts provider configuration to the approved AWS source and `~> 5.0` version constraint. |

### Approved geographical regions

The project uses the following AWS regions:

- Ireland: `eu-west-1`
- London: `eu-west-2`
- Frankfurt: `eu-central-1`
- Stockholm: `eu-north-1`

This is an approved geographical list, not a guarantee of complete data residency. London is in the UK, and other factors such as backups, replication and administrative access also need consideration.

The SSH example address `203.0.113.10/32` is a documentation-only IP address and would need to be replaced with a real authorised address before production use.

The current Terraform configuration does not contain external modules, so module-source restrictions have not been implemented.

## 6. Testing Results

I tested each policy using positive and negative mock test cases.

- Positive tests verified that compliant configurations were accepted.
- Negative tests verified that non-compliant configurations were rejected.

The complete test suite was run using:

```powershell
sentinel test .\policies
```

<badge color="success">All tests passed</badge>

**Final results:**

- 6 Sentinel policies.
- 15 individual test cases.
- All test cases passed in the final run.

### Screenshot evidence

All screenshots are stored separately in the **`Screenshots/`** folder in this GitHub repository.

I captured the successful test results for each of the six policies. The lecturer can open the folder directly on GitHub to view the evidence. The screenshots are provided separately rather than being embedded throughout this README.

## 7. GitHub Repository and Workflow

I used a separate feature branch for each policy instead of making all changes directly on the main branch.

For every policy, I completed the implementation, added the test cases, ran the tests, captured screenshot evidence, committed the changes and pushed the branch to GitHub. I then created and merged a pull request.

This helped me keep the project organised and made each policy implementation easier to review.

**GitHub repository:**

https://github.com/shaheermunawaratu/terraform-digital-sovereignty

## 8. Limitations and Future Improvements

The policies were tested locally using Sentinel mock data. They have not yet been connected to an HCP Terraform workspace for enforcement during actual Terraform runs.

Other improvements could include:

- Adding restrictions for trusted Terraform module sources and versions.
- Introducing more detailed data-residency checks for backups and replication.
- Adding stronger dependency provenance and security verification.
- Expanding network policies to cover additional sensitive ports.
- Integrating the policies into an automated CI/CD pipeline.
- Introducing runtime monitoring and regular cloud security audits.

## 9. Generative AI Disclosure

I used **OpenAI ChatGPT powered by GPT-6** throughout the assignment as an interactive development assistant.

I provided instructions for individual tasks, shared code and error messages, and asked for explanations and solutions. ChatGPT responded with implementation guidance, Sentinel policy examples, test cases, PowerShell instructions, troubleshooting suggestions and GitHub workflow guidance.

I followed the instructions, ran the commands in my own environment, reviewed the code, tested the policies and managed the repository and pull requests.

The interaction examples in this README are reconstructed summaries of the main instructions I gave ChatGPT. They are not presented as exact quotations of every original message.

**AI tool:** OpenAI ChatGPT  
**Model:** GPT-6  
**Provider:** OpenAI
