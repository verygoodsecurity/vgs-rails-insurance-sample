<p align="center"><a href="https://www.verygoodsecurity.com/"><img src="https://avatars0.githubusercontent.com/u/17788525" width="128" alt="VGS Logo"></a></p>
<p align="center"><b>vgs-rails-insurance-sample</b></p>
<p align="center"><i>Integration of Ruby on Rails 5 app with VGS</i></p>

## Requirements
- Ruby 2.5.1
- Rails >=5.2.1
- VGS [account](https://dashboard.verygoodsecurity.com/)
- [ngrok](https://ngrok.com/)

## Third-party services
_This version of application uses mock api insurance service_

## VGS base setup
1. Go to [VGS-Dashboard](https://dashboard.verygoodsecurity.com), create a new organization, create a new vault.
2. Select your vault, go to `Integration` page
3. Copy your proxy URL, it should be in format:
```
http://<user>:<password>@<tenant>.SANDBOX.verygoodproxy.com:8080
```
## Run application
1. Clone repository and go to project directory
2. Install gems with `./bin/bundle`
3. Run ngrok for mock service with `ngrok http 5000`
3. Start server and mock service by putting provided ngrok https address into `NGROK_HTTPS_LINK` with `docker-compose build && API_URL=<NGROK_HTTPS_LINK> docker-compose up`
4. Run ngrok for applcation with `ngrok http 3000`
5. Copy provided address `https://<some_id>.ngrok.io`

## Secure inbound traffic with VGS
1. Go to VGS dashboard
2. Go to `Secure traffic` -> `Inbound`
3. Put ngrok url to upstream
4. Application should be available by `https://<tenant>.sandbox.verygoodproxy.com/`
5. Fill forms in app, submit payment data
6. Open VGS dashboard, go to `Logs`
7. Ensure that logger is recording payloads
8. Find the request with account data, click on it
9. Click on `Secure this payload`
10. Select fields, click `Secure`

## Secure outbound traffic to 3d party application
1. Go to VGS dashboard
2. Go to `Secure traffic` -> `Outbound`
3. Switch to the application, press `Calculate` for one of the accounts
4. Go back to VGS dashboard, it should detect the outbound connection, click on `Secure data`
5. Find the request to mock API (ngrok call), click on it
6. Click on `Secure this payload`
7. Select fields, click `Secure`
8. Done, you outbound secure route has been created

## What is VGS?

_**Want to just jump right in?** Check out our [getting started
guide](https://www.verygoodsecurity.com/docs/getting-started)._

Very Good Security (VGS) allows you to enhance your security standing while
maintaining the utility of your data internally and with third-parties. As an
added benefit, we accelerate your compliance certification process and help you
quickly obtain security-related compliances that stand between you and your
market opportunities.

To learn more, visit us at https://www.verygoodsecurity.com/

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file
for details.