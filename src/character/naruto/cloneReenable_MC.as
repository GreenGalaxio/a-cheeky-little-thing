// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//cloneReenable_MC

package 
{
    import flash.display.MovieClip;

    public dynamic class cloneReenable_MC extends MovieClip 
    {

        public function cloneReenable_MC()
        {
            addFrameScript(15, this.frame16);
        }

        internal function frame16():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

