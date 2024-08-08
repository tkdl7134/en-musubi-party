const ctx = document.getElementById("ageDonutChart").getContext("2d");
const ageDonutChart = new Chart(ctx, {
    type: "doughnut",
    data: {
        labels: [
            "20代初め",
            "20代半ば",
            "20代後半",
            "30代初め",
            "30代半ば",
            "30代後半",
        ],
        datasets: [
            {
                label: "Age Distribution",
                data: [18, 18, 18, 18, 18, 20],
                backgroundColor: [
                    "#ef696e",
                    "#ff8b92",
                    "#ff5a5f",
                    "#ffc0c3",
                    "#f56c7a",
                    "#ffb0b4",
                ],
                hoverOffset: 4,
            },
        ],
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        cutout: "60%",
        plugins: {
            legend: {
                display: true,
                position: "bottom",
            },
        },
    },
});
