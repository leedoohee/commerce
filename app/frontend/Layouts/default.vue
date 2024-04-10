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
          <v-btn icon="mdi-dots-vertical"></v-btn>
        </template>
      </v-app-bar>
      
      <v-navigation-drawer
        class="bg-green-accent-1"
        theme="transparent"
        permanent
        v-model="drawer"
      >
        <v-list color="transparent">
          <v-list-item prepend-icon="mdi-view-dashboard" title="Dashboard"></v-list-item>
          <v-list-item prepend-icon="mdi-account-box" title="Account"></v-list-item>
          <v-list-item prepend-icon="mdi-gavel" title="Admin"></v-list-item>
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
    import { ref } from 'vue'

    const drawer = ref(null)
    const rail = ref(false)
    const modalFlag = ref(false)
    const admins = [
        ['Management', 'mdi-account-multiple-outline'],
        ['Settings', 'mdi-cog-outline'],
    ]

    const cruds = [
        ['Create', 'mdi-plus-outline'],
        ['Read', 'mdi-file-outline'],
        ['Update', 'mdi-update'],
        ['Delete', 'mdi-delete'],
    ]
</script>

<style lang="scss" scoped>

    .inertia-link {
        color: #212121;
        text-decoration-line: none;
    }
    
</style>