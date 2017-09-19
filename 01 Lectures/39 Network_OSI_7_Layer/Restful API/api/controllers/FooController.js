/**
 * UserController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
	bar : function(req, res) {
		res.ok()
	},

	fast : function(req, res) {
		var html = "<html>"
		html += "<body>"
		html += "<h1>"
		html += "IiiiiIiIIIIiIIIIIII"
		html += "</h1>"
		html += "<h2>"
		html += "dasfdasfdsfa"
		html += "</h2>"
		html += "</body>"
		html += "</html>"

		res.send(html)
	},

	calculatorJson : function(req, res) {
		var params = req.allParams()
		var a = parseInt(params.a, 10)
		var b = parseInt(params.b, 10)
		var c = a * bres.json({
			a : a,
			b : b,
			result : c
		})
	}
};

