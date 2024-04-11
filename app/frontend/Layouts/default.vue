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
          class="mt-5"
          :open="open"
          v-model="tree"
          :items="items"
          item-key="name"
          activatable
          open-all
          open-on-click
        >
            <template v-slot:prepend="{ item, open }">
            <v-icon v-if="!item.file">
              {{ open ? 'mdi-folder-open' : 'mdi-folder' }}
            </v-icon>
            <v-icon v-else>
              {{ files[item.file] }}
            </v-icon>
          </template>
        </v-treeview>

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

    const drawer = ref(null)
    const rail = ref(false)
    const modalFlag = ref(false)
    const initiallyOpen = ref(['public'])
    const files = ref({
        html: 'mdi-language-html5',
        js: 'mdi-nodejs',
        json: 'mdi-code-json',
        md: 'mdi-language-markdown',
        pdf: 'mdi-file-pdf-box',
        png: 'mdi-file-image',
        txt: 'mdi-file-document-outline',
        xls: 'mdi-file-excel',
    })
    const tree =  ref([])
    const items = reactive([
        {
          title: '.git',
        },
        {
          title: 'node_modules',
        },
        {
          title: 'public',
          children: [
            {
              title: 'static',
              children: [{
                title: 'logo.png',
                file: 'png',
              }],
            },
            {
              title: 'favicon.ico',
              file: 'png',
            },
            {
              title: 'index.html',
              file: 'html',
            },
          ],
        },
        {
          title: '.gitignore',
          file: 'txt',
        },
        {
          title: 'babel.config.js',
          file: 'js',
        },
        {
          title: 'package.json',
          file: 'json',
        },
        {
          title: 'README.md',
          file: 'md',
        },
        {
          title: 'vue.config.js',
          file: 'js',
        },
        {
          title: 'yarn.lock',
          file: 'txt',
        },
    ])
</script>

<style lang="scss" scoped>

    .inertia-link {
        color: #212121;
        text-decoration-line: none;
    }
    
</style>