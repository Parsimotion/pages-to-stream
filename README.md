# pages-to-stream

[![NPM version](https://badge.fury.io/js/pages-to-stream.png)](http://badge.fury.io/js/pages-to-stream)

Create a new RxStream from pages generator.

```coffee
# action:: pageToken -> Promise({items, nextPageToken})
action = (page = null) -> getPage(page).then( (items) -> {items, nextToken} )

aRxStream = new FromPages(action).stream()
```
