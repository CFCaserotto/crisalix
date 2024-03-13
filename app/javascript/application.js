// Dependencies
import { RalixApp } from 'ralix'
import "@hotwired/turbo-rails"
import "trix"
import "@rails/actiontext"

// Controllers
import AppCtrl      from './controllers/app'
import ArticlesCtrl from './controllers/articles'
import UsersCtrl     from './controllers/users'

// Components
import RemoteModal  from './components/remote_modal'
import Tooltip      from './components/tooltip'

const App = new RalixApp({
  routes: {
    '/articles$': ArticlesCtrl,
    '/users':     UsersCtrl,
    '/.*': AppCtrl
  },
  components: [
    RemoteModal,
    Tooltip
  ]
})

App.start()
