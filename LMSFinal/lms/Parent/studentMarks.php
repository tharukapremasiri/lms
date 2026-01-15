<?php
session_start();
require_once("../db_conn.php");
include("parentSidemenu.php");

// Check if the required POST parameters are set
if (isset($_POST['studentID']) && isset($_POST['testID'])) {
    $studentID = $_POST['studentID'];
    $testID = $_POST['testID'];

    // Fetch the subject and marks data based on studentID and testID
    $queryMarks = "
        SELECT 
            stm.subjectID,
            s.subjectName,
            stm.marks
        FROM 
            student_test_marks stm
        INNER JOIN 
            subject s ON stm.subjectID = s.subjectID
        WHERE 
            stm.studentID = '$studentID' AND stm.testID = '$testID'
    ";

    $resultMarks = $conn->query($queryMarks);
} else {
    echo "No student ID or test ID provided.";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Marks</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="dashboard-content">
        <div class="heading-box">
            <div class="box-1">
                <div class="title">
                    <p>View Marks</p>
                </div>
            </div>
        </div>

        <div class="table-section-item">
            <div class="table-container-item">
                <div class="table-box">
                    <table id="rows-def">
                        <tr id="table-head">
                            <th>Subject ID</th>
                            <th>Subject Name</th>
                            <th>Marks</th>
                        </tr>
                        <?php
                        $marksData = [];  // Array to hold marks data for chart
                        if ($resultMarks->num_rows > 0) {
                            while ($row = $resultMarks->fetch_assoc()) {
                                echo "<tr>
                                        <td>{$row['subjectID']}</td>
                                        <td>{$row['subjectName']}</td>
                                        <td>{$row['marks']}</td>
                                    </tr>";
                                // Collecting marks data for chart
                                $marksData[] = [
                                    'subjectName' => $row['subjectName'],
                                    'marks' => $row['marks']
                                ];
                            }
                        } else {
                            echo "<tr><td colspan='3'>No marks found for the selected test.</td></tr>";
                        }
                        ?>
                    </table>
                </div>
            </div>
        </div>

        <div class="bottom-box">
            <div class="button">
                <form action='viewTests.php' method='post'>
                    <input type='hidden' name='studentID' value='<?php echo $studentID; ?>'>
                    
                </form>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="chart-container" style="width: 60%; margin: auto;">
            <canvas id="marksChart" width="400" height="200"></canvas>
        </div>
    </div>

    <script>
        // Data for the chart
        const marksData = <?php echo json_encode($marksData); ?>;
        const labels = marksData.map(item => item.subjectName);
        const marks = marksData.map(item => item.marks);

        // Creating the bar chart
        const ctx = document.getElementById('marksChart').getContext('2d');
        const marksChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Marks',
                    data: marks,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>
