Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51NkQmqBmFMBRRena9mxy9ubEOxWw9K4W2Eh69WThTYmzuqMckHBEjiDNirTOWKH5gjDiWx0cuDXFyok2XjthTCBb00L2RKuAKX'],
  secret_key: ENV['sk_test_51NkQmqBmFMBRRenabOm23pEYYG1oiM3BnMLRodHkCw8rvImbvdRyFL6gY8NLVV6PMpfs2fsBDFwwyQNL2Rzn7B0K00vqTjNulq']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
