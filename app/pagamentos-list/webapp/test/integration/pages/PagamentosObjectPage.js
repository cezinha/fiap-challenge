sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'fiap.challenge.pagamentoslist',
            componentId: 'PagamentosObjectPage',
            entitySet: 'Pagamentos'
        },
        CustomPageDefinitions
    );
});