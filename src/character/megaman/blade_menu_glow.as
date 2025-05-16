// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blade_menu_glow

package 
{
    import flash.display.MovieClip;

    public dynamic class blade_menu_glow extends MovieClip 
    {

        public function blade_menu_glow()
        {
            addFrameScript(2, this.frame3);
        }

        internal function frame3():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

