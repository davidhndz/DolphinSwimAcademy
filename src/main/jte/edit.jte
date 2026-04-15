@import cs3220.lab8.model.Student

@param Student student

@template.layout(title = "Edit", content = @`
    <h1 class="mb-4">Edit Student</h1>

    <form method="post" action="/edit/${student.getId()}">
        <div class="row g-4">
            <div class="col-12 col-md-6">
                <label class="form-label" for="session-select">Session</label>
                <select class="form-select" name="session" id="session-select">
                    @if(student.getSession() == 1)
                        <option value="1" selected>June 17 - June 27</option>
                    @else
                        <option value="1">June 17 - June 27</option>
                    @endif
                    @if(student.getSession() == 2)
                        <option value="2" selected>July 8 - July 18</option>
                    @else
                        <option value="2">July 8 - July 18</option>
                    @endif
                    @if(student.getSession() == 3)
                        <option value="3" selected>July 22 - August 1</option>
                    @else
                        <option value="3">July 22 - August 1</option>
                    @endif
                    @if(student.getSession() == 4)
                        <option value="4" selected>August 5 - August 15</option>
                    @else
                        <option value="4">August 5 - August 15</option>
                    @endif
                </select>
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label" for="level-select">Level</label>
                <select class="form-select" name="level" id="level-select">
                    @if(student.getLevel() == 1)
                        <option value="1" selected>Starfish</option>
                    @else
                        <option value="1">Starfish</option>
                    @endif
                    @if(student.getLevel() == 2)
                        <option value="2" selected>Minnow</option>
                    @else
                        <option value="2">Minnow</option>
                    @endif
                    @if(student.getLevel() == 3)
                        <option value="3" selected>Guppies</option>
                    @else
                        <option value="3">Guppies</option>
                    @endif
                    @if(student.getLevel() == 4)
                        <option value="4" selected>Dolphin</option>
                    @else
                        <option value="4">Dolphin</option>
                    @endif
                </select>
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label" for="name">Name</label>
                <input class="form-control" type="text" id="name" name="name" value="${student.getName()}">
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label" for="birthYear">Birth Year</label>
                <input class="form-control" type="text" id="birthYear" name="birthYear" value="${student.getBirthYear()}">
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label d-block">Time (1st Choice)</label>
                <fieldset id="time1-group">
                    <div class="form-check form-check-inline">
                        @if("9-10am".equals(student.getTime1()))
                            <input class="form-check-input" type="radio" id="time1-9-10am" name="time1" value="9-10am" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time1-9-10am" name="time1" value="9-10am">
                        @endif
                        <label class="form-check-label" for="time1-9-10am">9-10am</label>
                    </div>

                    <div class="form-check form-check-inline">
                        @if("10-11am".equals(student.getTime1()))
                            <input class="form-check-input" type="radio" id="time1-10-11am" name="time1" value="10-11am" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time1-10-11am" name="time1" value="10-11am">
                        @endif
                        <label class="form-check-label" for="time1-10-11am">10-11am</label>
                    </div>

                    <div class="form-check form-check-inline">
                        @if("1-2pm".equals(student.getTime1()))
                            <input class="form-check-input" type="radio" id="time1-1-2pm" name="time1" value="1-2pm" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time1-1-2pm" name="time1" value="1-2pm">
                        @endif
                        <label class="form-check-label" for="time1-1-2pm">1-2pm</label>
                    </div>

                    <div class="form-check form-check-inline">
                        @if("2-3pm".equals(student.getTime1()))
                            <input class="form-check-input" type="radio" id="time1-2-3pm" name="time1" value="2-3pm" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time1-2-3pm" name="time1" value="2-3pm">
                        @endif
                        <label class="form-check-label" for="time1-2-3pm">2-3pm</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-12 col-md-6">
                <label class="form-label d-block">Time (2nd Choice)</label>
                <fieldset id="time2-group">
                    <div class="form-check form-check-inline">
                        @if("9-10am".equals(student.getTime2()))
                            <input class="form-check-input" type="radio" id="time2-9-10am" name="time2" value="9-10am" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time2-9-10am" name="time2" value="9-10am">
                        @endif
                        <label class="form-check-label" for="time2-9-10am">9-10am</label>
                    </div>

                    <div class="form-check form-check-inline">
                        @if("10-11am".equals(student.getTime2()))
                            <input class="form-check-input" type="radio" id="time2-10-11am" name="time2" value="10-11am" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time2-10-11am" name="time2" value="10-11am">
                        @endif
                        <label class="form-check-label" for="time2-10-11am">10-11am</label>
                    </div>

                    <div class="form-check form-check-inline">
                        @if("1-2pm".equals(student.getTime2()))
                            <input class="form-check-input" type="radio" id="time2-1-2pm" name="time2" value="1-2pm" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time2-1-2pm" name="time2" value="1-2pm">
                        @endif
                        <label class="form-check-label" for="time2-1-2pm">1-2pm</label>
                    </div>

                    <div class="form-check form-check-inline">
                        @if("2-3pm".equals(student.getTime2()))
                            <input class="form-check-input" type="radio" id="time2-2-3pm" name="time2" value="2-3pm" checked>
                        @else
                            <input class="form-check-input" type="radio" id="time2-2-3pm" name="time2" value="2-3pm">
                        @endif
                        <label class="form-check-label" for="time2-2-3pm">2-3pm</label>
                    </div>
                </fieldset>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit">Save Changes</button>
            </div>
        </div>
    </form>
`)
