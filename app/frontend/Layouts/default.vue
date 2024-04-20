<template>
  <v-app id="inspire">
    <v-layout class="rounded rounded-md">
      <v-navigation-drawer class="bg-green-accent-1" permanent v-model="drawer">
        <v-list>
          <v-list-item
            class="customPrepend"
            prepend-icon="$vuetify"
            title="eCommerce-admin"
          ></v-list-item>
        </v-list>

        <v-divider></v-divider>

        <v-list density="compact" nav>
          <v-list-item
            class="customPrepend"
            prepend-icon="mdi mdi-view-dashboard"
            title="Dashboard"
          ></v-list-item>

          <v-list-group value="Users">
            <template v-slot:activator="{ props }">
              <v-list-item
                class="customPrepend"
                v-bind="props"
                prepend-icon="mdi-account-circle"
                title="Users"
              ></v-list-item>
            </template>
            <v-list-item
              class="customPrepend"
              prepend-icon="mdi-home-city"
              title="Home"
              value="home"
            ></v-list-item>
            <v-list-item
              class="customPrepend"
              prepend-icon="mdi-account"
              title="My Account"
              value="account"
            ></v-list-item>
            <v-list-item
              class="customPrepend"
              prepend-icon="mdi-account-group-outline"
              title="Users"
              value="users"
            ></v-list-item>
          </v-list-group>
        </v-list>
      </v-navigation-drawer>

      <v-app-bar class="bg-green-accent-1">
        <template v-slot:prepend>
          <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
        </template>

        <template v-slot:append>
          <v-list-item
            prepend-avatar="https://randomuser.me/api/portraits/men/85.jpg"
            title="John Leider"
            nav
          >
            <template v-slot:activator>
              <v-btn
                icon="mdi-chevron-left"
                variant="text"
                @click.stop="rail = !rail"
              ></v-btn>
            </template>
          </v-list-item>
          <v-btn icon>
            <v-icon>mdi-export</v-icon>
          </v-btn>
        </template>
      </v-app-bar>

      <v-main>
        <v-container>
          <slot />
        </v-container>
      </v-main>
    </v-layout>
  </v-app>
</template>

<script setup>
import { ref, reactive } from "vue";

const isOpen = ref(null);
const drawer = ref(true);
const rail = ref(true);
const items = ref([
  {
    icon: "mdi mdi-monitor-dashboard",
    title: "Dashboard",
    route: "/dashboard",
  },
  { icon: "mdi mdi-star-circle", title: "Ratings" },
  {
    icon: "mdi mdi-account-group",
    title: "Drivers",
    subItems: [
      { title: "Add Driver", route: "/drivers/add" },
      { title: "Add Driver", route: "/drivers/add" },
    ],
  },
  {
    icon: "mdi mdi-account-star",
    title: "Manager",
    active: true,
    route: "/managers",
    subItems: [
      { title: "Add Manager", route: "/managers/add" },
      { title: "Managers", route: "/managers" },
    ],
  },
  { icon: "mdi mdi-account", title: "Manage Users" },
]);
const open = ref(["Users"]);
const admins = [
  ["Management", "mdi-account-multiple-outline"],
  ["Settings", "mdi-cog-outline"],
];
const cruds = [
  ["Create", "mdi-plus-outline"],
  ["Read", "mdi-file-outline"],
  ["Update", "mdi-update"],
  ["Delete", "mdi-delete"],
];
</script>

<style scoped>
.v-list-group {
  margin-left: 0;
}
.customPrepend :deep(.v-list-item__prepend .v-list-item__spacer) {
  width: 8px;
  margin-left: 0;
}
</style>
