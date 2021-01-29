<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'server' );

/** MySQL database username */
define( 'DB_USER', 'atweek' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost:3307' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '>3Y`uS:tz 9)@` !B8DeD/x~n({%BXgwA*TTg|k`cdd+fq>IKV*+:@m~+BR#sp}Z');
define('SECURE_AUTH_KEY',  'o%8+<2V*_|^bA/, !H5,{.D?F$P$FAUQQ)DNE-W`+b8qCI ,li[vaa:sPo*4Tu)1');
define('LOGGED_IN_KEY',    'vEB<9!.Bh8~e>|l%f>l}hpwBvrb;6C1nM`j;,MuI=GCr#^O5EdH@430xFw)zmmWP');
define('NONCE_KEY',        '@$DWPZG[@>$;pd}Ry<gvH[u^I@A.JCwjt{-^a6@x7l(` 82}?CN-:<m/Sq!5a+2B');
define('AUTH_SALT',        'b^7%*~Br3m@M50wry1vea-{?|r1x~-5%@3y5c>r+bn-hs61kEoPY#OK{.$MogK05');
define('SECURE_AUTH_SALT', 'or5v SxS6&uHZY5] q!=F@|M!v(UtLU.UYPTU Hr8x;9jK|%3+u%*mD{.@4r5Pkh');
define('LOGGED_IN_SALT',   'LSe~ yb`Vm4fAR3=-(-]ZFuV2F%qjtU^Zu(y{t(D`-N].?h1&b36PS#M:-I=(>!+');
define('NONCE_SALT',       'c2[fi//i5QdD8oPkEFN4b~j8-oW?ncNwdvHA47=}/[F`{gV|8`Oi@ @6S1/3[~$k');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
