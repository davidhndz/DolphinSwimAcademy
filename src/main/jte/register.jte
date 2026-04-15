@import cs3220.lab8.model.Student

@param Student student
@template.layout(title = "Register" , content = @`

    <h1 class="mb-4">Register</h1>
    <form method="post" action="/register">
        <div class="row g-4">
            <div class="col-12 col-md-6">
                <label class="form-label" for="session-select">Session</label>
                <select class="form-select" name="session" id="session-select">
                    <option value="1">June 17 - June 27</option>
                    <option value="2">July 8 - July 18</option>
                    <option value="3">July 22 - August 1</option>
                    <option value="4">August 5 - August 15</option>
                </select>
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label" for="level-select">Level</label>
                <select class="form-select" name="level" id="level-select">
                    <option value="1">Starfish</option>
                    <option value="2">Minnow</option>
                    <option value="3">Guppies</option>
                    <option value="4">Dolphin</option>
                </select>
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label" for="name">Name</label>
                <input class="form-control" type="text" id="name" name="name">
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label" for="birthYear">Birth Year</label>
                <input class="form-control" type="text" id="birthYear" name="birthYear">
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label d-block">Time (1st Choice)</label>
                <fieldset id="time1-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time1-9-10am" name="time1" value="9-10am">
                        <label class="form-check-label" for="time1-9-10am">9-10am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time1-10-11am" name="time1" value="10-11am">
                        <label class="form-check-label" for="time1-10-11am">10-11am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time1-1-2pm" name="time1" value="1-2pm">
                        <label class="form-check-label" for="time1-1-2pm">1-2pm</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time1-2-3pm" name="time1" value="2-3pm">
                        <label class="form-check-label" for="time1-2-3pm">2-3pm</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label d-block">Time (2nd Choice)</label>
                <fieldset id="time2-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time2-9-10am" name="time2" value="9-10am">
                        <label class="form-check-label" for="time2-9-10am">9-10am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time2-10-11am" name="time2" value="10-11am">
                        <label class="form-check-label" for="time2-10-11am">10-11am</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time2-1-2pm" name="time2" value="1-2pm">
                        <label class="form-check-label" for="time2-1-2pm">1-2pm</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="time2-2-3pm" name="time2" value="2-3pm">
                        <label class="form-check-label" for="time2-2-3pm">2-3pm</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit">Register</button>
            </div>
        </div>
    </form>

`)
