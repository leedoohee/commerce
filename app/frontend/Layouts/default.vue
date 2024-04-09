<template>
    <v-app id="inspire">
      <v-navigation-drawer expand-on-hover rail>
        <v-list>
          <v-list-item
            prepend-avatar="https://randomuser.me/api/portraits/women/85.jpg"
            subtitle="sandra_a88@gmailcom"
            title="Sandra Adams"
          ></v-list-item>
        </v-list>

        <v-divider></v-divider>

        <v-list v-model:opened="modalFlag">
          <v-list-item prepend-icon="mdi-home" title="Home"></v-list-item>

          <v-list-group value="Users">
              <template v-slot:activator="{ props }">
                <v-list-item
                  v-bind="props"
                  prepend-icon="mdi-account-circle"
                  title="Users"
                ></v-list-item>
              </template>

              <v-list-group value="Admin">
                <template v-slot:activator="{ admins }">
                  <v-list-item
                    v-bind="props"
                    title="Admin"
                  ></v-list-item>
                </template>

                <v-list-item
                  v-for="([title, icon], i) in admins"
                  :key="i"
                  :prepend-icon="icon"
                  :title="title"
                  :value="title"
                ></v-list-item>
              </v-list-group>

              <v-list-group value="Actions">
                <template v-slot:activator="{ cruds }">
                  <v-list-item
                    v-bind="props"
                    title="Actions"
                  ></v-list-item>
                </template>

                <v-list-item
                  v-for="([title, icon], i) in cruds"
                  :key="i"
                  :prepend-icon="icon"
                  :title="title"
                  :value="title"
                ></v-list-item>
              </v-list-group>
            </v-list-group>
          </v-list>
      </v-navigation-drawer>

      <v-app-bar color="white">
        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
  
        <v-app-bar-title>admin</v-app-bar-title>

        <v-btn icon>
          <v-icon>mdi-export</v-icon>
        </v-btn>
      </v-app-bar>
  
      <v-main>
        <v-container>
          <slot />
        </v-container>
      </v-main>
    </v-app>
</template>
  
<script setup>
    import { ref } from 'vue'

    const drawer = ref(null)
    const modalFlag = ref(null)
    data: () => ({
      open: ['Users'],
      admins: [
        ['Management', 'mdi-account-multiple-outline'],
        ['Settings', 'mdi-cog-outline'],
      ],
      cruds: [
        ['Create', 'mdi-plus-outline'],
        ['Read', 'mdi-file-outline'],
        ['Update', 'mdi-update'],
        ['Delete', 'mdi-delete'],
      ],
    })

</script>

<style lang="scss" scoped>

    .inertia-link {
        color: #212121;
        text-decoration-line: none;
    }

</style>