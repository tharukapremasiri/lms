<?php
session_start();
require_once("../db_conn.php");
include("parentSidemenu.php");

if (!isset($_SESSION["user"]) || $_SESSION["user"]["role"] !== "Parent") {
    echo '<script>window.location = "../login.php";</script>';
    die();
}

$studentID = $_SESSION['user']['studentID'];
$gradeID = $_SESSION['user']['gradeID'];

// Initialize termTestMarks array
$termTestMarks = [];

// Fetch term tests related to the student's grade
$sqlTermTests = "
    SELECT testID, term, year
    FROM term_test
    WHERE gradeID = ?
";

if ($stmt = $conn->prepare($sqlTermTests)) {
    $stmt->bind_param("i", $gradeID);
    $stmt->execute();
    $resultTermTests = $stmt->get_result();
    
    if ($resultTermTests && $resultTermTests->num_rows > 0) {
        while ($termTestRow = $resultTermTests->fetch_assoc()) {
            $termTestID = $termTestRow['testID'];
            $termTestIdentifier = "Term: " . $termTestRow['term'] . ", Year: " . $termTestRow['year'];

            // Fetch marks and subjects for each term test
            $queryMarks = "
                SELECT 
                    stm.subjectID,
                    s.subjectName,
                    AVG(stm.marks) as average_marks  -- Calculate average marks if needed
                FROM 
                    student_test_marks stm
                INNER JOIN 
                    subject s ON stm.subjectID = s.subjectID
                WHERE 
                    stm.studentID = ? AND stm.testID = ?
                GROUP BY 
                    stm.subjectID, s.subjectName
            ";

            if ($marksStmt = $conn->prepare($queryMarks)) {
                $marksStmt->bind_param("ii", $studentID, $termTestID);
                $marksStmt->execute();
                $marksResult = $marksStmt->get_result();

                $marksData = [];
                while ($row = $marksResult->fetch_assoc()) {
                    $marksData[] = [
                        'subjectName' => $row['subjectName'],
                        'marks' => $row['average_marks']  // Use average marks
                    ];
                }
                $termTestMarks[$termTestIdentifier] = $marksData;
                $marksStmt->close();
            } else {
                echo "Failed to prepare marks statement: " . $conn->error;
            }
        }
    } else {
        echo "No term tests found for the selected grade.";
    }
    $stmt->close();
} else {
    echo "Failed to prepare term tests statement: " . $conn->error;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Marks by Term Test</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="dashboard-content">
        <div class="heading-box">
            <div class="box-1">
                <div class="title">
                    <p>View Marks by Term Test</p>
                </div>
            </div>
        </div>

        <?php if (!empty($termTestMarks)): ?>
            <?php foreach ($termTestMarks as $termTest => $marksData): ?>
                <div class="chart-container" style="width: 60%; margin: auto; margin-top: 20px;">
                    <h3><?php echo htmlspecialchars($termTest, ENT_QUOTES, 'UTF-8'); ?></h3>
                    <canvas id="marksChart<?php echo htmlspecialchars(str_replace([' ', ':', ','], '', $termTest), ENT_QUOTES, 'UTF-8'); ?>" width="400" height="200"></canvas>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No marks available for the selected term tests.</p>
        <?php endif; ?>
    </div>

    <script>
        // Data for the charts
        const termTestMarks = <?php echo json_encode($termTestMarks, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); ?>;

        Object.keys(termTestMarks).forEach(termTest => {
            const marksData = termTestMarks[termTest];
            const labels = marksData.map(item => item.subjectName);
            const marks = marksData.map(item => item.marks);

            const chartID = 'marksChart' + termTest.replace(/[^a-zA-Z0-9]/g, '');
            const ctx = document.getElementById(chartID).getContext('2d');
            new Chart(ctx, {
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
        });
    </script>
</body>
</html>
