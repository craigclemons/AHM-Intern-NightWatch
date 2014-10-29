module.exports = {
        "Test site Login" : function (browser) {
                browser
                        .url("qa2-3.physicaltherapy.com")
                        //.waitForElementVisible('body',1000)
                        .setValue('input[type=username]','ahm')
			.setValue('input[type=password]','billrocks')
                        .waitForElementVisible('button[name=Log In]',1000)
                        .click('button[name=Log In]')
                        .pause(1000)
//                        .assert.containsText('#main','The Night Watch')
                        .end();

        }
};
~    
