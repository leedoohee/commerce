// JsFromRoutes CacheKey ad58a3ba961e2c2db434b787b2d86844
//
// DO NOT MODIFY: This file was automatically generated by JsFromRoutes.
import { definePathHelper } from '@js-from-routes/client'

export default {
  index: /* #__PURE__ */ definePathHelper('get', '/orders'),
  create: /* #__PURE__ */ definePathHelper('post', '/orders'),
  new: /* #__PURE__ */ definePathHelper('get', '/orders/new'),
  edit: /* #__PURE__ */ definePathHelper('get', '/orders/:id/edit'),
  show: /* #__PURE__ */ definePathHelper('get', '/orders/:id'),
  update: /* #__PURE__ */ definePathHelper('patch', '/orders/:id'),
  destroy: /* #__PURE__ */ definePathHelper('delete', '/orders/:id'),
}