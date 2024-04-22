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
          <v-list-group value="dashboard">
            <template v-slot:activator="{ props }">
              <v-list-item
                class="customPrepend"
                v-bind="props"
                prepend-icon="mdi-monitor-dashboard"
                title="dashboard"
              ></v-list-item>
            </template>
            <iLink
              key="dashboard"
              href="/dashboard"
              role="navigation"
              class="inertia-link"
            >
              <v-list-item
                color="primary"
                link
                class="customPrepend"
                title="dashboard"
              ></v-list-item>
            </iLink>
          </v-list-group>

          <v-list-group value="categories">
            <template v-slot:activator="{ props }">
              <v-list-item
                class="customPrepend"
                v-bind="props"
                prepend-icon="mdi-gradient-horizontal"
                title="categories"
              ></v-list-item>
            </template>
            <iLink
              key="Manage categories"
              href="/categories"
              role="navigation"
              class="inertia-link"
            >
              <v-list-item
                color="primary"
                link
                class="customPrepend"
                title="manage categories"
              ></v-list-item>
            </iLink>
          </v-list-group>

          <v-list-group value="Products">
            <template v-slot:activator="{ props }">
              <v-list-item
                class="customPrepend"
                v-bind="props"
                prepend-icon="mdi-shopping"
                title="Products"
              ></v-list-item>
            </template>
            <iLink
              key="Manage Products"
              href="/products"
              role="navigation"
              class="inertia-link"
            >
              <v-list-item
                color="primary"
                link
                class="customPrepend"
                title="manage Products"
              ></v-list-item>
            </iLink>
          </v-list-group>

          <v-list-group value="Orders">
            <template v-slot:activator="{ props }">
              <v-list-item
                class="customPrepend"
                v-bind="props"
                prepend-icon="mdi-order-bool-descending"
                title="Orders"
              ></v-list-item>
            </template>
            <iLink
              key="Manage Orders"
              href="/orders"
              role="navigation"
              class="inertia-link"
            >
              <v-list-item
                color="primary"
                link
                class="customPrepend"
                title="manage Orders"
              ></v-list-item>
            </iLink>
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
</script>

<style scoped>
.v-list-group {
  margin-left: 0;
}
.customPrepend :deep(.v-list-item__prepend .v-list-item__spacer) {
  width: 8px;
  margin-left: 0;
}
.inertia-link {
  color: #000000;
  text-decoration-line: none;
}
</style>
