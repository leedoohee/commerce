<template>
  <v-container class="fluid grid-list-xl" fluid>
    <v-row>
      <v-col v-for="(card, i) in cards" :key="i" cols="12" md="4">
        <v-card elevation="4">
          <div class="pa-4">
            <div class="ps-4 text-caption text-medium-emphasis">
              {{ card.title }}
            </div>

            <v-card-title class="pt-0 mt-n1 d-flex align-center">
              <div class="me-2">{{ card.value }}</div>

              <v-chip
                :color="card.color"
                :prepend-icon="`mdi-arrow-${card.change.startsWith('-') ? 'down' : 'up'}`"
                class="pe-1"
                size="x-small"
                label
              >
                <template v-slot:prepend>
                  <v-icon size="10"></v-icon>
                </template>

                <span class="text-caption">{{ card.change }}</span>
              </v-chip>
            </v-card-title>
          </div>

          <v-sparkline
            :color="card.color"
            :gradient="[
              `${card.color}E6`,
              `${card.color}33`,
              `${card.color}00`,
            ]"
            :model-value="card.data"
            height="50"
            line-width="1"
            min="0"
            padding="0"
            fill
            smooth
          ></v-sparkline>
        </v-card>
      </v-col>
    </v-row>
    <v-row>
      <v-divider></v-divider>
    </v-row>
    <v-row>
      <v-col class="d-flex align-center" cols="6" sm="6">
        <v-card elevation="4" style="width: 100%">
          <apexchart
            type="line"
            style="margin-top: 35px; width: 100%; height: 100%"
            :options="chartOptions_v3"
            :series="series_v3"
          ></apexchart>
        </v-card>
      </v-col>
      <v-col class="d-flex align-center" cols="6" sm="6">
        <v-card elevation="4" style="width: 100%">
          <apexchart
            type="bar"
            style="margin-top: 35px; width: 100%; height: 100%"
            :options="chartOptions_v4"
            :series="series_v4"
          ></apexchart>
        </v-card>
      </v-col>
    </v-row>
    <v-row>
      <v-divider></v-divider>
    </v-row>
    <v-row>
      <v-col class="d-flex align-center" cols="6" sm="6">
        <v-card elevation="4" style="width: 100%">
          <apexchart
            type="area"
            style="margin-top: 35px; width: 100%; height: 100%"
            :options="chartOptions_v2"
            :series="series_v2"
          ></apexchart>
        </v-card>
      </v-col>
      <v-col class="d-flex align-center" cols="6" sm="6">
        <v-card elevation="4" style="width: 100%">
          <apexchart
            type="treemap"
            style="margin-top: 35px; width: 100%; height: 100%"
            :options="chartOptions"
            :series="series"
          ></apexchart>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { ref, defineProps, reactive } from "vue";
import VueApexCharts from "vue-apexcharts";
import { VSparkline } from "vuetify/labs/VSparkline";

export default {
  name: "chart",
  components: {
    VueApexCharts,
    VSparkline,
  },
  data: () => ({
    series: [
      {
        name: "Desktops",
        data: [
          {
            x: "ABC",
            y: 10,
          },
          {
            x: "DEF",
            y: 60,
          },
          {
            x: "XYZ",
            y: 41,
          },
        ],
      },
      {
        name: "Mobile",
        data: [
          {
            x: "ABCD",
            y: 10,
          },
          {
            x: "DEFG",
            y: 20,
          },
          {
            x: "WXYZ",
            y: 51,
          },
          {
            x: "PQR",
            y: 30,
          },
          {
            x: "MNO",
            y: 20,
          },
          {
            x: "CDE",
            y: 30,
          },
        ],
      },
    ],
    chartOptions: {
      legend: {
        show: false,
      },
      chart: {
        height: 350,
        type: "treemap",
      },
      title: {
        text: "Multi-dimensional Treemap",
        align: "center",
      },
    },
    series_v2: [
      {
        name: "series1",
        data: [31, 40, 28, 51, 42, 109, 100],
      },
      {
        name: "series2",
        data: [11, 32, 45, 32, 34, 52, 41],
      },
    ],
    chartOptions_v2: {
      chart: {
        height: 350,
        type: "area",
      },
      dataLabels: {
        enabled: false,
      },
      stroke: {
        curve: "smooth",
      },
      xaxis: {
        type: "datetime",
        categories: [
          "2018-09-19T00:00:00.000Z",
          "2018-09-19T01:30:00.000Z",
          "2018-09-19T02:30:00.000Z",
          "2018-09-19T03:30:00.000Z",
          "2018-09-19T04:30:00.000Z",
          "2018-09-19T05:30:00.000Z",
          "2018-09-19T06:30:00.000Z",
        ],
      },
      tooltip: {
        x: {
          format: "dd/MM/yy HH:mm",
        },
      },
    },
    series_v3: [
      {
        name: "Website Blog",
        type: "column",
        data: [440, 505, 414, 671, 227, 413, 201, 352, 752, 320, 257, 160],
      },
      {
        name: "Social Media",
        type: "line",
        data: [23, 42, 35, 27, 43, 22, 17, 31, 22, 22, 12, 16],
      },
    ],
    chartOptions_v3: {
      chart: {
        height: 350,
        type: "line",
      },
      stroke: {
        width: [0, 4],
      },
      title: {
        text: "Traffic Sources",
      },
      dataLabels: {
        enabled: true,
        enabledOnSeries: [1],
      },
      labels: [
        "01 Jan 2001",
        "02 Jan 2001",
        "03 Jan 2001",
        "04 Jan 2001",
        "05 Jan 2001",
        "06 Jan 2001",
        "07 Jan 2001",
        "08 Jan 2001",
        "09 Jan 2001",
        "10 Jan 2001",
        "11 Jan 2001",
        "12 Jan 2001",
      ],
      xaxis: {
        type: "datetime",
      },
      yaxis: [
        {
          title: {
            text: "Website Blog",
          },
        },
        {
          opposite: true,
          title: {
            text: "Social Media",
          },
        },
      ],
    },
    series_v4: [
      {
        name: "",
        data: [200, 330, 548, 740, 880, 990, 1100, 1380],
      },
    ],
    chartOptions_v4: {
      chart: {
        type: "bar",
        height: 350,
      },
      plotOptions: {
        bar: {
          borderRadius: 0,
          horizontal: true,
          distributed: true,
          barHeight: "80%",
          isFunnel: true,
        },
      },
      colors: [
        "#F44F5E",
        "#E55A89",
        "#D863B1",
        "#CA6CD8",
        "#B57BED",
        "#8D95EB",
        "#62ACEA",
        "#4BC3E6",
      ],
      dataLabels: {
        enabled: true,
        formatter: function (val, opt) {
          return opt.w.globals.labels[opt.dataPointIndex];
        },
        dropShadow: {
          enabled: true,
        },
      },
      title: {
        text: "Pyramid Chart",
        align: "middle",
      },
      xaxis: {
        categories: [
          "Sweets",
          "Processed Foods",
          "Healthy Fats",
          "Meat",
          "Beans & Legumes",
          "Dairy",
          "Fruits & Vegetables",
          "Grains",
        ],
      },
      legend: {
        show: false,
      },
    },
    bandwidth: [5, 2, 5, 9, 5, 10, 3, 5, 3, 7, 1, 8, 2, 9, 6],
    requests: [1, 3, 8, 2, 9, 5, 10, 3, 5, 3, 7, 6, 8, 2, 9, 6],
    cache: [9, 9, 9, 9, 8.9, 9, 9, 9, 9, 9],
  }),
  computed: {
    cards() {
      return [
        {
          title: "Bandwidth Used",
          value: "1.01 TB",
          change: "-20.12%",
          color: "#da5656",
          data: this.bandwidth,
        },
        {
          title: "Requests Served",
          value: "7.96 M",
          change: "-7.73%",
          color: "#da5656",
          data: this.requests,
        },
        {
          title: "Cache Hit Rate",
          value: "95.69 %",
          change: "0.75%",
          color: "#2fc584",
          data: this.cache,
        },
      ];
    },
  },
};
</script>
<style>
.v-sheet--offset {
  top: -24px;
  position: relative;
}
</style>
