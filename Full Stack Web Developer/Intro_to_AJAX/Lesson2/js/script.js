
function loadData() {

    var $body = $('body');
    var $wikiElem = $('#wikipedia-links');
    var $nytHeaderElem = $('#nytimes-header');
    var $nytElem = $('#nytimes-articles');
    var $greeting = $('#greeting');

    // clear out old data before new request
    $wikiElem.text("");
    $nytElem.text("");

    // load streetview
    var street = $('#street').val();
    var city = $('#city').val();
    var address = street + ', ' + city;

    // Google API Images
    var streetViewUrl = 'http://maps.googleapis.com/maps/api/streetview?size=600x300&location=' + address + '';
        $body.append('<img class="bgimg" src="' + streetViewUrl + '">');


    // NY Times Articles
    var nytimes_url = 'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=' + city + '&sort=newest&api-key=b56f71c629474140a303784bf30f2f8';
    $.getJSON( nytimes_url, function( data ) {
        $nytHeaderElem.text('New York Times Articles About' + city);
        articles = data.response.docs;
        for (var i = 0; i < articles.length; i++) {
            var article = articles[i];
            $nytElem.append('<li class="article">' + '<a href="' + article.web_url + '">' + article.headline.main + '</a>' + '<p>' + article.snippet + '</p>' + '</li>');
        };
    })
    .error(function(e) {
        $nytHeaderElem.text('New York Times Articles Could Not Be Found');
    });


    // Wikipedia Articles
    var wiki_url = 'http://en.wikipedia.org/w/api.php?action=opensearch&search=' + city + '&format=json&callback=wikiCallback';
    $.ajax( {
        url: wiki_url,
        dataType: 'jsonp',
        success: function(response) {

        }
    });

    return false;
};

$('#form-container').submit(loadData);
