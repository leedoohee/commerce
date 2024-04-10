// JsFromRoutes CacheKey 5236a79ee29d1d3c95e267c22ac64599
//
// DO NOT MODIFY: This file was automatically generated by JsFromRoutes.
import { definePathHelper } from '@js-from-routes/client'

export default {
  index: /* #__PURE__ */ definePathHelper('get', '/users'),
  create: /* #__PURE__ */ definePathHelper('post', '/users'),
  new: /* #__PURE__ */ definePathHelper('get', '/users/new'),
  edit: /* #__PURE__ */ definePathHelper('get', '/users/:id/edit'),
  show: /* #__PURE__ */ definePathHelper('get', '/users/:id'),
  update: /* #__PURE__ */ definePathHelper('patch', '/users/:id'),
  destroy: /* #__PURE__ */ definePathHelper('delete', '/users/:id'),
}
