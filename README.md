# pages-to-stream


Create a new RxStream from pages generator.

```coffee
// action:: pageToken -> Promise({items, nextPageToken})
action = (page = null) -> getPage(page).then( (items) -> {items, newPage} )

aRxStream = new FromPages(action).stream()
```
