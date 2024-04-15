<template>
  <v-toolbar color="green-accent-1">
    <v-app-bar-nav-icon></v-app-bar-nav-icon>

    <v-toolbar-title>상품관리</v-toolbar-title>

    <v-spacer></v-spacer>

    <v-btn icon>
      <v-icon>mdi-magnify</v-icon>
    </v-btn>

    <v-btn icon>
      <v-icon>mdi-heart</v-icon>
    </v-btn>

    <v-btn icon>
      <v-icon>mdi-dots-vertical</v-icon>
    </v-btn>
  </v-toolbar>
  <v-expansion-panels
    v-model="panel"
    :disabled="disabled"
  >
    <v-expansion-panel>
      <v-expansion-panel-title>
        <template v-slot:default="{ expanded }">
          <v-row no-gutters>
            <v-col class="d-flex justify-start" cols="4"> Trip name </v-col>
            <v-col class="text-grey" cols="8">
              <v-fade-transition leave-absolute>
                <span v-if="expanded" key="0"> Enter a name for the trip </span>
                <span v-else key="1">
                  {{ trip.name }}
                </span>
              </v-fade-transition>
            </v-col>
          </v-row>
        </template>
      </v-expansion-panel-title>
      <v-expansion-panel-text>
        <v-carousel hide-delimiters>
          <v-carousel-item
            src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
            cover
          ></v-carousel-item>

          <v-carousel-item
            src="https://cdn.vuetifyjs.com/images/cards/hotel.jpg"
            cover
          ></v-carousel-item>

          <v-carousel-item
            src="https://cdn.vuetifyjs.com/images/cards/sunshine.jpg"
            cover
          ></v-carousel-item>
        </v-carousel>
      </v-expansion-panel-text>
    </v-expansion-panel>

    <v-expansion-panel>
      <v-expansion-panel-title v-slot="{ expanded }">
        <v-row no-gutters>
          <v-col class="d-flex justify-start" cols="4"> Location </v-col>
          <v-col class="text--secondary" cols="8">
            <v-fade-transition leave-absolute>
              <span v-if="expanded" key="0"> Select trip destination </span>
              <span v-else key="1">
                {{ trip.location }}
              </span>
            </v-fade-transition>
          </v-col>
        </v-row>
      </v-expansion-panel-title>
      <v-expansion-panel-text>
        <v-row>
          <v-col
            cols="12"
            sm="6"
          >
            <v-text-field
              label="사이즈" 
              variant="outlined"
              color="green-accent-1"
              v-model="size"
              @keydown.enter="addSize"
            >
              <template v-slot:prepend-inner>
                <div v-for="(sizeText , index) in sizeData" :key="index">
                  <v-chip color="green-accent-1" closable>{{sizeText}}</v-chip>
                </div>
              </template>
            </v-text-field>
          </v-col>
          <v-col
            cols="12"
            sm="6"
          >
            <v-text-field
              label="컬러" 
              variant="outlined"
              color="green-accent-1"
              v-model="color"
              @keydown.enter="addColor"
            >
              <template v-slot:prepend-inner>
                <div v-for="(colorText , index) in colorData" :key="index">
                  <v-chip color="green-accent-1" closable>{{colorText}}</v-chip>
                </div>
              </template>
            </v-text-field>
          </v-col>
        </v-row>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="secondary" variant="text"> Cancel </v-btn>
          <v-btn color="primary" variant="text"> Save </v-btn>
        </v-card-actions>
      </v-expansion-panel-text>
    </v-expansion-panel>

    <v-expansion-panel>
      <v-expansion-panel-title v-slot="{ expanded }">
        <v-row no-gutters>
          <v-col class="d-flex justify-start" cols="4">
            Start and end dates
          </v-col>
          <v-col class="text--secondary" cols="8">
            <v-fade-transition leave-absolute>
              <span v-if="expanded">When do you want to travel?</span>
              <v-row v-else style="width: 100%" no-gutters>
                <v-col class="d-flex justify-start" cols="6">
                  Start date: {{ trip.start || "Not set" }}
                </v-col>
                <v-col class="d-flex justify-start" cols="6">
                  End date: {{ trip.end || "Not set" }}
                </v-col>
              </v-row>
            </v-fade-transition>
          </v-col>
        </v-row>
      </v-expansion-panel-title>
      <v-expansion-panel-text>
        <v-card>
          <QuillEditor theme="snow" style="height: 500px;"/>
        </v-card>
      </v-expansion-panel-text>
    </v-expansion-panel>
  </v-expansion-panels>
</template>
<script>
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";

export default {
  name: "show",
  components: {
    QuillEditor,
  },
  data: () => ({
    trip: {
      name: "",
      location: null,
      start: null,
      end: null,
    },
    sizeData: [],
    colorData: [],
    locations: [
      "Australia",
      "Barbados",
      "Chile",
      "Denmark",
      "Ecuador",
      "France",
    ],
    panel: [0, 1, 2],
    disabled: false,
    expanded: true
  }),
  methods: {
    addSize() {
      this.sizeData.push(this.size);
      this.size = "";
    },
    addColor() {
      this.colorData.push(this.color);
      this.color = "";
    }
  }
}
</script>
