var ready;
ready = function() {

    var engine = new Bloodhound({
        datumTokenizer: function(d) {
            console.log(d);
            return Bloodhound.tokenizers.whitespace(d.value);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote:{
            'url' : '../search/autocomplete?q=%QUERY',
            'replace' : function(url,query) {
                var q = '../search/autocomplete?q='
                    + query;
                return q;
            }
        }
    });

    var promise = engine.initialize();

    promise
        .done(function() { console.log('success!'); })
        .fail(function() { console.log('err!'); });

    $('.typeahead').typeahead(null, {
        name: 'engine',
        displayKey: 'name',
        source: engine.ttAdapter()
    });

}

$(document).ready(ready);
$(document).on('page:load', ready);