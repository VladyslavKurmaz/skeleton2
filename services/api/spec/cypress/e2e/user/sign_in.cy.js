describe('Sign in', () => {
    beforeEach(() => {
        cy.appScenario('sign_in');
        cy.visit('/');
    });

    it('signs in user with valid credentials', () => {
        cy.login('user@example.com', 'test123');

        cy.get('[id="alert"]').should('contain','Signed in successfully.')
        cy.get('a[href*="/sign_out"]').contains('Sign out').should('be.visible');
    });

    it('does not sign in user with invalid credentials', () => {
        cy.login('user@example.com', 'wrong_password');

        cy.get('[id="alert"]').should('contain','Invalid Email or password.')
        cy.get('a[href*="/sign_out"]').should('not.exist');
    });
});

