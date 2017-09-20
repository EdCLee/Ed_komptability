/**
 * UserController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
	index : function(req, res) {

		sails.log('upload started')

		req.file('test').upload({
			maxBytes: 10000000
		},function whenDone(err, uploadedFiles) {
			sails.log('upload done')
			if (err) {
				return res.negotiate(err);
			}

			if (uploadedFiles.length === 0) {
				return res.badRequest('No file was uploaded');
			}

			if (err) return res.negotiate(err);

			return res.json({
				message: uploadedFiles.length + 'file(s) uploaded successfully!'
			});
		});		
	}
};

