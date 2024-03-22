function authenticateDriver(req, res, next) {
    if (req.isAuthenticated() && req.user.userType === 'Driver') {
        return next();
    }
    res.redirect('/login');
}

function authenticateAdmin(req, res, next) {
    if (req.isAuthenticated() && req.user.userType === 'Admin') {
        return next();
    }
    res.redirect('/login');
}

