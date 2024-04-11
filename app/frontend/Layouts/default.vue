<template>
    <v-app id="inspire">
      <v-app-bar
        class="bg-green-accent-1"
        density="compact"
      >
        <template v-slot:prepend>
          <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
        </template>

        <v-app-bar-title>어드민</v-app-bar-title>

        <template v-slot:append>
          <v-btn icon>
            <v-icon>mdi-export</v-icon>
          </v-btn>
        </template>
      </v-app-bar>
      
      <v-navigation-drawer
        class="bg-green-accent-1"
        permanent
        v-model="drawer"
      >
        <v-treeview
          :items="items"
          item-value="id"
          open-all
        ></v-treeview>

        <v-list>
            <v-list-item class="customPrepend">
                <v-list-item-content>
                    <v-list-item-title class="title">
                        <span class="font-weight-bold">Al-Mehmood</span>
                    </v-list-item-title>
                    <v-list-item-subtitle>Transport Company</v-list-item-subtitle>
                </v-list-item-content>
            </v-list-item>
            <v-divider></v-divider>
            <v-list-item
              class="customPrepend"
              v-for="(item, i) in navLinks"
              :key="i"
              :value="item"
              color="primary"
            >
              <template v-slot:prepend>
                <v-icon :icon="item.icon"></v-icon>
              </template>

              <v-list-item-title>{{ item.text }}</v-list-item-title>
              <v-list-item
                v-for="(sub, i) in item.subLinks"
                :key="i"
                :value="sub"
                color="primary"
              >
                <template v-slot:prepend>
                  <v-icon :icon="sub.icon"></v-icon>
                </template>

                <v-list-item-title>{{ sub.text }}</v-list-item-title>
              </v-list-item>
            </v-list-item>
        </v-list>
      </v-navigation-drawer>
  
      <v-main>
        <v-container>
          <slot />
        </v-container>
      </v-main>
    </v-app>
</template>
  
<script setup>
    import { ref, reactive } from 'vue'

    const drawer = ref(true)
    const navLinks = [
        { icon: "dashboard", text: "Dashboard", route: "/" },
        { icon: "star", text: "Ratings", route: "/ratings" },
        {
            icon: "people",
            text: "Drivers",
            route: "/drivers",
            subLinks: [
                { text: "Add Driver", route: "/drivers/add" },
                { text: "Add Driver", route: "/drivers/add" }
            ]
        },
        {
            icon: "person_outline",
            text: "Manager",
            route: "/managers",
            subLinks: [
                { text: "Add Manager", route: "/managers/add" },
                { text: "Managers", route: "/managers" }
            ]
        },
        { icon: "person", text: "Manage Users", route: "/users" }
    ]
    const items= [
        {
          id: 1,
          title: 'Applications :',
          children: [
            { id: 2, title: 'Calendar : app' },
            { id: 3, title: 'Chrome : app' },
            { id: 4, title: 'Webstorm : app' },
          ],
        },
        {
          id: 5,
          title: 'Documents :',
          children: [
            {
              id: 6,
              title: 'vuetify :',
              children: [
                {
                  id: 7,
                  title: 'src :',
                  children: [
                    { id: 8, title: 'index : ts' },
                    { id: 9, title: 'bootstrap : ts' },
                  ],
                },
              ],
            },
            {
              id: 10,
              title: 'material2 :',
              children: [
                {
                  id: 11,
                  title: 'src :',
                  children: [
                    { id: 12, title: 'v-btn : ts' },
                    { id: 13, title: 'v-card : ts' },
                    { id: 14, title: 'v-window : ts' },
                  ],
                },
              ],
            },
          ],
        },
        {
          id: 15,
          title: 'Downloads :',
          children: [
            { id: 16, title: 'October : pdf' },
            { id: 17, title: 'November : pdf' },
            { id: 18, title: 'Tutorial : html' },
          ],
        },
        {
          id: 19,
          title: 'Videos :',
          children: [
            {
              id: 20,
              title: 'Tutorials :',
              children: [
                { id: 21, title: 'Basic layouts : mp4' },
                { id: 22, title: 'Advanced techniques : mp4' },
                { id: 23, title: 'All about app : dir' },
              ],
            },
            { id: 24, title: 'Intro : mov' },
            { id: 25, title: 'Conference introduction : avi' },
          ],
        },
      ]
</script>

<style scoped>
    .customPrepend :deep(.v-list-item__prepend .v-list-item__spacer) {
      width: 32px;
    }
</style>