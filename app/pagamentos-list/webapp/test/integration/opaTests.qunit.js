sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiap/challenge/pagamentoslist/test/integration/FirstJourney',
		'fiap/challenge/pagamentoslist/test/integration/pages/PagamentosList',
		'fiap/challenge/pagamentoslist/test/integration/pages/PagamentosObjectPage'
    ],
    function(JourneyRunner, opaJourney, PagamentosList, PagamentosObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiap/challenge/pagamentoslist') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePagamentosList: PagamentosList,
					onThePagamentosObjectPage: PagamentosObjectPage
                }
            },
            opaJourney.run
        );
    }
);