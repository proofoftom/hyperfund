
export default [
  {
    path: '/',
    component: () => import('layouts/default'),
    children: [
      { path: '', component: () => import('pages/index') },
    ],
  },

  {
    path: '/create',
    component: () => import('layouts/default'),
    children: [
      { path: '', component: () => import('pages/create') },
    ],
  },

  {
    path: '/proposals',
    component: () => import('layouts/default'),
    children: [
      { path: '', component: () => import('pages/proposals') },
    ],
  },

  {
    path: '/account',
    component: () => import('layouts/default'),
    children: [
      { path: '', component: () => import('pages/account') },
    ],
  },

  { // Always leave this as last one
    path: '*',
    component: () => import('pages/404'),
  },
];
