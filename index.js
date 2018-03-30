const { exec } = require('child_process')
const PubNub = require('pubnub')

const CHANNEL = 'pimote-deployments'

const log = (...messages) => console.log(new Date().toISOString(), ...messages)

const pubnub = new PubNub({
	subscribeKey : process.env.PUBNUB_SUBSCRIBE_KEY
})

pubnub.addListener({
	message(data) {
		log('received_message', JSON.stringify(data))
		const { message: { name, url } } = data

		exec(`./deploy.sh ${name} "${url}"`, (error, stdout, stderr) => {
			if (error) log(name, error)
			log(name, 'stdout:', stdout)
			log(name, 'stderr:', stderr)
		})
	},
})

try {
	pubnub.subscribe({
		channels: [CHANNEL]
	})
	log('subscribed', CHANNEL)
} catch (e) {
	throw e
}
