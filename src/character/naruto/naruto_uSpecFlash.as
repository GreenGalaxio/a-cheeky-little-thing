// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_uSpecFlash

package 
{
    import flash.display.MovieClip;

    public dynamic class naruto_uSpecFlash extends MovieClip 
    {

        public function naruto_uSpecFlash()
        {
            addFrameScript(4, this.frame5);
        }

        internal function frame5():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

