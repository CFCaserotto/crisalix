# 🚀 Rails + Ralix + Tailwind

> Starter Kit to build modern Rails applications fast

Powered by:

- [Rails](https://rubyonrails.org)
- [Ralix](https://github.com/ralixjs/ralix)
- [Tailwind CSS](https://tailwindcss.com)
- [PostgreSQL](https://www.postgresql.org)
- [Turbo](https://turbo.hotwired.dev)
- [esbuild](https://esbuild.github.io)

Rails v7 application template ready to start building your next project, with a pre-configured modern front-end stack and some extras:

- 🎨 Minimalistic and responsive, clean layout
- 📦 Icons pack, via [Heroicons](https://heroicons.com)
- 🔐 Authentication, via [Devise](https://github.com/heartcombo/devise) + [OmniAuth](https://github.com/omniauth/omniauth) for Social Logins
- 👥 Authorization, via [CanCanCan](https://github.com/CanCanCommunity/cancancan)
- 🔍 Searching, via [Ransack](https://github.com/activerecord-hackery/ransack)
- 📝 Rich text edition, via [Trix](https://trix-editor.org)
- 🔢 Pagination, via [Pagy](https://github.com/ddnexus/pagy)
- 📄 Static pages controller (About, Terms, ...)
- 🔴 Custom errors pages: 404, 422, 500
- 📚 *Ready-to-use* components: Tables, Buttons, Forms, Cards, Modals and Tooltips

## Install

Clone this repository (or use the GitHub *template* button), then `cd` into the folder and run:

```
> bin/setup
```

## Run

Start the development server:

```
> bin/dev
```
## Comment
Sign-in Instructions:

To sign in as a patient, please use the following credentials:
Email: gemma@example.com
Password: password

To sign in as a doctor, please use the following credentials:
Email: gemmadr@example.com
Password: password

Seed Data:
The application comes pre-seeded with the following data:

5 patient accounts
5 doctor accounts
Some appointments with three fake photos attached.

To run tests:
You can run the following commands to execute the different types of tests:
Model Tests:
- rspec spec/models
Request Tests:
- rspec spec/requests
Feature Tests:
- rspec spec/features

PS. "If ./bin/dev does not respond, use the following commands: rails assets:precompile, and then bundle exec rails server."
