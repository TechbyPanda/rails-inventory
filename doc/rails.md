# Ruby on rails

https://guides.rubyonrails.org/getting_started.html

## To create new project
rails new [project name]

## How to Start a project?
rails server

## How to check version?
rails --version

## What is ruby on rails?
a popular open-source, server-side web application framework written in the Ruby programming language

## Core Philosophy & Architecture
The framework is built around two major software engineering principles:
- Convention over Configuration (CoC): Instead of making developers configure endless setup files, Rails assumes default structures and names. You only customize the parts that deviate from the standard.
- Don't Repeat Yourself (DRY): Code should be written once and reused, reducing duplication and maintaining clean, manageable logic.

## Model-View-Controller (MVC) architectural pattern:
- Model (Active Record): Handles data logic, database communication, and validation rules.
- View (Action View): Manages user interface presentation, embedding dynamic backend information into HTML.
- Controller (Action Controller): Acts as the intermediary, accepting incoming HTTP requests, talking to the Model, and directing the View.

## Pros
1. High Productivity: Built-in generators, tools, and scaffolding make development extremely rapid.
2. Robust Tooling: Pre-loaded with everything for testing, security checks, and automation.
3. Massive Ecosystem: Developers can use thousands of reusable pre-packaged libraries called "gems".

## Cons
1. Performance Limitations: Runtime speeds can be slower compared to lightweight architectures or newer compiled languages.
2. Multithreading Constraints: The framework features specific execution restrictions due to Ruby's global interpreter lock.
3. Opinionated Design: It can feel rigid if you want to write a completely custom architecture outside its standards.

## Who Uses Rails?
Many of the world's most successful tech platforms rely on Rails to power their backend operations, including:
1. GitHub
2. Shopify
3. Airbnb
4. Basecamp
5. Twitch

## Basic Project Flow
(Database)
1. Migration file in db/migrate/20260920114200_create_inventory_system.rb (

    Rails breaks it down using the format YYYYMMDDHHMMSS:
    2026 = Year
    09 = Month (September)
    20 = Day
    12 = Hour (12 PM)
    00 = Minute
    00 = Second
)
2. command `rails db:migrate`
3. Writing the Active Record Models