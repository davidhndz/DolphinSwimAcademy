@template.layout(title = "index", content = @`
    <div class="container mt-5 col">
        <div class="d-flex flex-column gap-4">
            <div class="justify-content-center text-center my-2">
                <h2 class="fs-1">2024 Summer Swimming Lessons</h2>
                <div class="fs-5 mt-3">
                    <p>Classes are on Monday to Thursday</p>
                    <p>Session 1: June 17 - June 27</p>
                    <p>Session 2: July 8 - July 18</p>
                    <p>Session 3: July 22 - August 1</p>
                    <p>Session 4: August 5 - August 15</p>
                </div>
                <form class="mt-5" action="register" method="get">
                    <button class="btn btn-primary fs-5" type="submit">Register</button>
                </form>
            </div>
        </div>
    </div>
`)